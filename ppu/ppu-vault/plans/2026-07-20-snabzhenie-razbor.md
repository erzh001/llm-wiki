---
type: plan
status: open
sensitivity: private
scope: work
horizon: now
date: 2026-07-20
updated: 2026-07-20
tags: [plan, procurement, snabzhenie, systems]
related:
  - ../systems/ppu-crm-app
  - ../status
---

# План — разобрать снабжение (procurement)

**Горизонт:** now. **Статус:** open.

## Цель

Разобрать подсистему снабжения ppu-crm и зафиксировать знание в vault:
как устроен путь от потребности до входящей поставки, какие сущности и модули
участвуют, где узкие места.

## Что входит в «снабжение» (по коду ppu-crm)

- Модуль: `src/lib/procurement`.
- Модели Prisma: `Supplier`, `SupplierContact`, `SupplierProduct`,
  `SupplierPricelist` / `SupplierPricelistItem`, `SupplierPrice`,
  `PriceRequest` / `PriceRequestItem`, `PurchaseRequest` / `PurchaseRequestLine`,
  `SupplierOffer`, `SpecialSupplierQuote`, `PurchaseOrder` / `PurchaseOrderLine`,
  `SupplierClaim` / `SupplierClaimItem`, `InboundDelivery`.

## Результат (deliverable)

- Карточка подсистемы `systems/procurement.md`: назначение, поток
  (потребность → запрос цен → оффер → заказ → входящая поставка → претензия),
  связи со складом/производством/финансами. Что это и зачем, не имплементация.
- При находках — уроки в `lessons/`, спорные решения — в `decisions/`.

## Шаги

1. Прочитать `src/lib/procurement` + связанные модели в `prisma/`.
2. Восстановить поток и точки интеграции (склад, производство, финансы).
3. Записать `systems/procurement.md`; зафиксировать открытые вопросы/блокеры
   в `status.md`.

## Открытые вопросы

- Глубина разбора: только карта потока или до уровня API/сервисов?
  (уточнить перед шагом 3)
