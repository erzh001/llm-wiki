---
type: reference
status: active
sensitivity: private
scope: work
axis: vault
date: 2026-07-20
updated: 2026-07-20
tags: [home, map, ppu]
related:
  - principles
  - status
  - ../../meta-vault/vault-template
---

# ppu-vault

База знаний домена разработки продукта **ppu-crm**. Семантическая карта — старт
отсюда. Дверь — `../CLAUDE.md`. Соответствует
[[meta-vault/vault-template|meta-vault/vault-template]].

## Что это

ppu-crm — ERP/CRM для производственного бизнеса (Next.js 16 + Prisma/libSQL +
воркер коммуникаций WhatsApp/email). Домен ведёт знание *о разработке продукта*:
архитектура, роадмап, техрешения, уроки. Сам код — вне неймспейса (см.
[[ppu/ppu-vault/systems/ppu-crm-app|systems/ppu-crm-app]]).

## Обязательное

- [[ppu/ppu-vault/status|status]] — горячее текущее состояние (читать каждую сессию).
- [[ppu/ppu-vault/principles|principles]] — конвенции (база + дельты).
- [[ppu/ppu-vault/secrets-map|secrets-map]] — указатели на доступы (без значений).
- **market/** — [[ppu/ppu-vault/market/overview|ландшафт CRM/ERP]] + `competitors/`.
- **plans/** — [[ppu/ppu-vault/plans/README|роадмап продукта]].
- **tasks/** — [[ppu/ppu-vault/tasks/README|per-cycle run-data]].

## Зоны

- **systems/** — [[ppu/ppu-vault/systems/README|компоненты продукта]]; главная
  карточка — [[ppu/ppu-vault/systems/ppu-crm-app|ppu-crm-app]].
- **decisions/** · **lessons/** — прецеденты и операционные уроки
  ([[ppu/ppu-vault/decisions/README|decisions/README]] ·
  [[ppu/ppu-vault/lessons/README|lessons/README]]).
- **tools/** · **people/** · **clients/** · **analytics/** · **research/** —
  справочные/аналитические зоны, растут по мере надобности.
- **positioning.md** — [[ppu/ppu-vault/positioning|внешнее предложение продукта]].
- **_archive/** — терминальная зона (живых ссылок из канона нет).
