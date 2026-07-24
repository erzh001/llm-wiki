---
type: reference
status: active
sensitivity: private
scope: work
date: 2026-07-20
updated: 2026-07-20
tags: [system, code-pointer, architecture, ppu-crm]
related:
  - ../status
  - ../lessons/nextjs-16-breaking
  - ../../../meta-vault/tech/README
---

# systems/ppu-crm-app — карточка кода (указатель)

Что это и зачем, **не** имплементация. Правда — в репо; это срез на 2026-07-20.

## Где

- Репозиторий: `/Users/erzhanmoldagaliev/Sites/ppu-crm` (собственный git).
- Деплой: Vercel (`vercel.json`); воркер — PM2 (`pm2.config.cjs`).

## Что это

ERP/CRM для производственного бизнеса: единая система от сделки до отгрузки,
плюс закупки, производство, склад, финансы, HR и оборудование, с встроенными
коммуникациями (WhatsApp + email) и AI.

## Стек

- **Frontend/SSR:** Next.js 16 (App Router), React 19, Tailwind, Radix UI,
  zustand, react-hook-form + zod, @tanstack/react-table, dnd-kit.
- **Данные:** Prisma 7 + libSQL (`@prisma/adapter-libsql`, `libsql`) — вероятно
  Turso. Авторизация: next-auth v4 (`@auth/prisma-adapter`).
- **Воркер коммуникаций:** `worker/communications.ts` (tsx, под PM2) —
  `whatsapp-web.js` (WhatsApp), `imapflow` + `nodemailer` (email).
- **Прочее:** `@anthropic-ai/sdk` (AI), `@react-pdf/renderer` + `qrcode` (PDF),
  `xlsx` (импорт/экспорт), `date-fns`.

## Раскладка `src/`

- `app/(app)` — приложение; `app/api` — API; `app/(auth)` — вход.
- `components/` — `ui`, `layout`, `catalog`, `production`, `communications`,
  `proposals`, `shared`.
- `lib/` — `procurement`, `calculators`, `services`, `communications`.

## Домены данных (Prisma, ~120 моделей)

- **Продажи:** Client, Contact, Deal, Proposal, Order, ClientInvoice, Contract.
- **Закупки/поставщики:** Supplier, PriceRequest, PurchaseOrder, SupplierOffer,
  SupplierPricelist, SupplierClaim.
- **Производство:** Product/ProductFamily (конфигуратор), BOMTemplate,
  WorkCenter, ProductionOrder, ProductionBatch, ProductionProcessTemplate.
- **Склад/логистика:** StockItem, StockLot, StockReservation, Shipment,
  Carrier, Vehicle, DeliveryRoute, InboundDelivery.
- **Финансы:** ManagementAccount, CostCenter, FinanceEntry, CashPlanItem.
- **HR:** Employee, Payroll, LeaveRequest, EmployeeLoan.
- **Оборудование:** EquipmentAsset, MaintenancePlan, EquipmentWorkOrder.
- **Коммуникации:** ChannelAccount, CommunicationTemplate, OutboundBatch,
  OutboundMessage, InboundMessage, DeliveryEvent, MessageAttachment.

## Важно при работе с кодом

- Репо несёт свой `AGENTS.md`: Next.js 16 с ломающими изменениями — читать
  `node_modules/next/dist/docs/` перед кодом. Урок:
  [[ppu/ppu-vault/lessons/nextjs-16-breaking|lessons/nextjs-16-breaking]].
- Скрипты: `npm run dev`, `worker` / `worker:start|stop|restart|logs` (PM2),
  `build` (prisma generate + next build), `db:migrate` / `db:push`.
