---
type: status
status: active
sensitivity: private
scope: work
date: 2026-07-24
updated: 2026-07-24
tags: [status, hot]
---

# status — edu-center

Горячее состояние. Читать в начале сессии; держать маленьким и актуальным.
**Блокеры должны быть видимы здесь, не закопаны** (базовое правило).

## Фокус

- Стадия: **скелет vault заведён** (2026-07-24), наполнение знанием не начато.
- Код продукта живёт вне неймспейса: `/Users/erzhanmoldagaliev/Sites/edu-center`
  (свой git). Карточка:
  [[edu-center/edu-center-vault/systems/edu-center-app|systems/edu-center-app]].
- Реализация уже широкая: 34 Prisma-модели, ~128 endpoints, auth (OTP+пароль+
  MFA, refresh с семейной ротацией), RLS-миграция, 21 route-модуль.

## Блокеры / не сделано (на 2026-07-24, срез при заведении домена)

- **Две папки миграций** — `backend/migrations/` И `backend/prisma/migrations/`;
  модель `automations` лежит отдельно от остальных. Риск рассинхрона — свести
  в одну.
- **RLS вне транзакции** — `rls.plugin.ts` ставит `SET app.tenant_id` (без
  `LOCAL`); на пуле соединений между запросами это небезопасно. Плагин сам
  предупреждает: в prod оборачивать в `$transaction` + `SET LOCAL`.
- **Тесты минимальны** — 2 файла (`auth.service`, `schedule.business`); широкий
  бэк почти не покрыт.
- **Провайдеры-заглушки** — SMS/email в `mock` (TODO в `auth.service.ts`:
  реальная отправка OTP / invite / reset не подключена).
- **Незакоммиченное в репо** — правки в `backend/src/auth/auth.service.ts` в
  рабочем дереве (на момент изучения).
- **Разрыв доки↔код** — `CLAUDE.md` репо заявляет 370 endpoints и часть уже
  сделанного в TODO; фактически ~128 endpoints и RLS/фичи готовы. Синхронизация
  карточки/доки — ручная и осознанная.

## Источник бизнес-знания

- edustar адаптирует накопленное бизнес-знание из
  [[biz-knowledge/biz-knowledge-vault/HOME|biz-knowledge]] (дистиллят SHARKS:
  стратегия, оргдизайн, продажи, маркетинг, юнит-экономика). Продукт (код) — это
  `edu-center`; *как вести бизнес школы* — там.

## Указатели

- Карта: [[edu-center/edu-center-vault/HOME|HOME]] · правила:
  [[edu-center/edu-center-vault/principles|principles]].
- Код: [[edu-center/edu-center-vault/systems/edu-center-app|systems/edu-center-app]] ·
  секреты: [[edu-center/edu-center-vault/secrets-map|secrets-map]].
