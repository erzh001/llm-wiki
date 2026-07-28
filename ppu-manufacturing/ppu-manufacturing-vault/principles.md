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

# Принципы — ppu-manufacturing (дельты)

Следует **базе**: [[meta-vault/principles|meta-vault/principles]] +
[[meta-vault/vault-template|meta-vault/vault-template]]. Здесь — только дельты.

## Дельты

- **Производство, не перепродажа и не софт.** Домен про физический выпуск трубы:
  оборудование, цех, себестоимость, качество, сбыт. Отделён от `chem-resale`
  (импорт сырья) и `ppu` (разработка ppu-crm).
- **Связь с `chem-resale` разрешена и естественна** — там вход (полиол/MDI), здесь
  потребление. Ссылаться на chem-resale как на канал сырья — норма (единственная
  межтоварная связка в неймспейсе про ППУ).
- **`systems/` = производственная цепочка и оборудование**, не приложение
  (кроме проекта «teplocom» — учётного веб-приложения; его код, если появится, —
  своя дверь).
- **Партнёр и ТОО — чувствительное.** Конфликт с партнёром, подписи, деньги —
  сырьё держать в private `life/`, здесь только обезличенный факт/указатель.
- **`sensitivity: private`.** Поставщики, себестоимость, партнёрские дела — не для
  публики.
- **Секреты только указателями** ([[ppu-manufacturing/ppu-manufacturing-vault/secrets-map|secrets-map]]).
- **Язык.** Инфраструктура — по базовому правилу; операционка — на языке ведения дел.
