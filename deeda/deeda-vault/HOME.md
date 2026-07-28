---
type: reference
status: active
sensitivity: private
scope: work
axis: vault
date: 2026-07-28
updated: 2026-07-28
tags: [home, map, deeda]
related:
  - principles
  - status
  - ../../meta-vault/vault-template
---

# deeda-vault

База знаний домена **магазина мужской одежды «deeda»** (преимущественно
костюмы). Семантическая карта — старт отсюда. Дверь — `../CLAUDE.md`.
Соответствует [[meta-vault/vault-template|meta-vault/vault-template]].

## Что это

Розничный магазин мужской одежды с акцентом на костюмы (сорочки, обувь,
аксессуары — сопутствующее). Клиенты — мужчины, покупающие костюм под повод
(работа, событие, свадьба) или гардероб. Домен ведёт знание *об ассортименте,
рынке, клиентах, канале продаж и операционке*.

## Обязательное

- [[deeda/deeda-vault/status|status]] — горячее состояние (читать каждую сессию).
- [[deeda/deeda-vault/principles|principles]] — конвенции (база + дельты).
- [[deeda/deeda-vault/secrets-map|secrets-map]] — указатели на доступы (без значений).

## Зоны

- [[deeda/deeda-vault/overview|overview]] — бизнес, производство, экономика,
  аудит канала.
- **plans/** — [[deeda/deeda-vault/plans/sales-growth-roadmap|sales-growth-roadmap]]
  (документ-решение) + [[deeda/deeda-vault/plans/tiktok-live-test|tiktok-live-test]]
  (сценарий эфира).
- **market/** — [[deeda/deeda-vault/market/modnoplus|modnoplus]] (эталон
  live-commerce). **clients/** · **positioning.md** — по мере наполнения.
- **systems/** — операционка магазина (закуп/поставщики, склад, витрина, продажи)
  _(по надобности)_.
- **decisions/** · **lessons/** · **people/** · **tools/** — растут по надобности.

> Домен только заведён — зоны создаются при первом наполнении, не заранее.
