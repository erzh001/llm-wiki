---
type: reference
status: active
sensitivity: private
scope: work
date: 2026-07-24
updated: 2026-07-24
tags: [system, code-pointer, architecture, edu-center]
related:
  - ../status
  - ../../../meta-vault/tech/README
---

# systems/edu-center-app — карточка кода (указатель)

Что это и зачем, **не** имплементация. Правда — в репо; это срез на 2026-07-24.

## Где

- Репозиторий: `/Users/erzhanmoldagaliev/Sites/edu-center` (собственный git,
  ветка `main`, без remote на момент среза).
- Свой `CLAUDE.md` в корне репо — главный технический контекст (ERD, API-map,
  бизнес-правила). Читать его перед кодом.
- Деплой: Docker + Nginx (prod); `.github/workflows/` заведён.

## Что это

Multi-tenant SaaS (CRM+ERP) для **сети школ английского языка** (B2C для
конечных пользователей, B2B для школ-tenant'ов). Каждый tenant = школа. Ядро:
студенты/группы → расписание/посещаемость → абонементы/платежи → CRM-воронка;
плюс «конкурентные» фичи (loyalty, payroll, referral, waitlist,
online-payments, QR, booking-widget, подписание договоров, аналитика,
broadcast, клиентский портал).

## Стек

- **Backend:** Node + TypeScript + Fastify + Prisma ORM. PostgreSQL 15 (5
  schemas: public/crm/finance/schedule/audit). Redis (сессии, rate-limit,
  очереди). BullMQ (очереди уведомлений). Swagger UI на `/docs`.
- **Frontend:** React 18 + TypeScript + Vite + Zustand + React Query + Tailwind.
  API-клиент с авто-refresh, auth-store.
- **Infra:** Docker Compose (Postgres, Redis, MinIO/S3, MailHog) для dev;
  Docker + Nginx для prod.
- **Объём:** backend ~6.4k строк TS, frontend ~5.4k строк.

## Auth (реально реализован)

- **Клиенты (parent/student):** SMS OTP на телефон, пароля нет.
- **Сотрудники:** email+password, первый вход через invite-link.
- **Директор:** email+password + обязательный TOTP MFA.
- Токены: access JWT 15 мин (`{ sub, tenant_id, role, permissions }`) + refresh
  opaque 30 дней в Redis. **Семейная ротация:** повторное использование
  refresh → logout из всех сессий tenant'а.
- `generateTokens` принимает `signFn` (старая JWT-заглушка из TODO **убрана**).

## Multi-tenant / изоляция

- Каждая таблица несёт `tenant_id`; каждый запрос фильтруется по `tenant_id` из
  JWT (app-уровень) **+** PostgreSQL RLS (defence in depth). Есть миграция
  `20240101000000_rls_policies` и `rls.plugin.ts`.
- ⚠️ RLS-плагин ставит `SET app.tenant_id` **без `LOCAL`** — на connection pool
  небезопасно между запросами; в prod оборачивать в `$transaction` + `SET
  LOCAL` (см. [[edu-center/edu-center-vault/status|status]] → блокеры).

## Раскладка `backend/src/` (21 route-модуль)

- `auth/` — OTP, пароль, MFA, refresh (`auth.service.ts`, `auth.routes.ts`).
- `students/` — students, groups, waitlist.
- `schedule/` — schedule, qr, booking.
- `finance/` — finance, loyalty, payroll, online-payments.
- `crm/` — crm (лиды/клиенты/чаты/NPS), contracts, contract-signing, referral.
- `notifications/` — notifications, broadcast, `queue.ts` (BullMQ).
- `users/`, `automations/` (+ `automation-engine.ts`), `analytics/`, `portal/`.
- `common/` — `prisma.ts`, `redis.ts`, `seed.ts`, `types.ts`, plugins
  (`auth`, `rls`, `audit`), `middleware/error.handler.ts`.

## Домены данных (Prisma, 34 модели)

- **Ядро/public:** Tenant, User, UserSession.
- **CRM:** Lead, Client, Student, Group, GroupStudent, Conversation, Message,
  NpsSurvey, Referral, GroupWaitlist.
- **Расписание:** Room, Lesson, Attendance, Homework, TrialBooking.
- **Финансы:** Subscription, StudentSubscription, LessonDebit, Payment, Invoice,
  InvoiceItem, LoyaltyAccount, LoyaltyTransaction, TeacherSalaryRate,
  PayrollEntry, OnlinePaymentSession.
- **Договоры:** Contract, ContractSigningToken.
- **Прочее:** NotificationTemplate, Automation, AuditLog.

## API

- ~128 endpoints реально (`54 GET / 57 POST / 10 PUT / 7 DELETE`), все под
  `/api/v1`. (В репо-`CLAUDE.md` заявлено 370 — цифра аспирационная.)
- Стандарты: пагинация (`page/limit/sort/search` + `meta`), единый формат
  ошибок (`code/message/details`), audit-log на каждый POST/PUT/DELETE через
  Fastify hook.

## Ключевые бизнес-правила (из репо)

- Учитель/кабинет не могут быть заняты дважды одновременно; урок с отмеченной
  посещаемостью нельзя удалить; перенос = новый урок + архив старого + уведомл.
- Урок списывается с абонемента в момент `attendance = present` (транзакционно);
  баланс 0 → уведомление; срок истёк → заморозка, не удаление; возврат — через
  отдельный approval-workflow.
- Платежи: idempotency-key обязателен; удаление запрещено (только refund); всё
  в audit_log.

## Тесты / зрелость

- Тесты: 2 файла (`auth.service.test.ts`, `schedule.business.test.ts`) — Vitest;
  покрытие минимальное.
- Провайдеры SMS/email в `mock` (реальная отправка — TODO).

## Команды (из репо)

- Infra: `cd infrastructure/docker && docker compose up -d`.
- Backend: `npm run db:generate` / `db:migrate` / `seed` / `dev` (:3000).
- Frontend: `npm run dev` (:5173).
- Тестовые логины после seed: `director@demo.kz` / `manager@demo.kz` /
  `teacher1@demo.kz` (пароль `password123`); клиенты — по OTP (код в консоль).
