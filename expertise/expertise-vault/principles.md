---
type: reference
status: active
sensitivity: private
scope: work
date: 2026-07-28
updated: 2026-07-28
tags: [principles, conventions, deltas]
related:
  - ../../meta-vault/principles
  - ../../meta-vault/vault-template
---

# Принципы — expertise (дельты)

Следует **базе**: [[meta-vault/principles|meta-vault/principles]] +
[[meta-vault/vault-template|meta-vault/vault-template]]. Здесь — только дельты.

## Дельты

- **Клиентский бизнес.** `clients/`, `market/`, `positioning.md` — активные зоны
  (заказчики экспертиз, канал, оффер), не заглушки.
- **`market/` = реальный рынок заказчиков KZ** (суды, страховые, бизнес,
  частные), не продуктовый ландшафт. `competitors/` — другие экспертные/оценочные
  организации Павлодара/KZ.
- **Достоверность = продукт.** Экспертиза продаёт доверие к заключению: опора на
  аккредитованные лаборатории, независимость, юридическая пригодность заключения.
  Это отражать в позиционировании и решениях.
- **`sensitivity: private`.** Заказчики, дела, реквизиты — не для публики.
- **Секреты только указателями.** Сайт/Google Ads-кабинет, реквизиты юрлица — в
  `secrets/` / вне git; в vault только
  [[expertise/expertise-vault/secrets-map|secrets-map]].
- **Язык.** Инфраструктура — по базовому правилу; операционные заметки — на языке
  ведения дел (рус/каз).
