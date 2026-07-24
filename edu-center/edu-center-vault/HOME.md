---
type: reference
status: active
sensitivity: private
scope: work
axis: vault
date: 2026-07-24
updated: 2026-07-24
tags: [home, map, edu-center]
related:
  - principles
  - status
  - ../../meta-vault/vault-template
---

# edu-center-vault

База знаний домена разработки продукта **EduCenter CRM+ERP**. Семантическая
карта — старт отсюда. Дверь — `../CLAUDE.md`. Соответствует
[[meta-vault/vault-template|meta-vault/vault-template]].

## Что это

EduCenter — multi-tenant SaaS (CRM+ERP) для сети школ английского языка. Каждый
tenant = школа. Стек: Fastify + Prisma + PostgreSQL (+ Redis/BullMQ) на бэке,
React 18 + Vite на фронте. Домен ведёт знание *о разработке продукта*:
архитектура, роадмап, техрешения, бизнес-правила, уроки. Сам код — вне
неймспейса (см.
[[edu-center/edu-center-vault/systems/edu-center-app|systems/edu-center-app]]).

## Обязательное

- [[edu-center/edu-center-vault/status|status]] — горячее текущее состояние (читать каждую сессию).
- [[edu-center/edu-center-vault/principles|principles]] — конвенции (база + дельты).
- [[edu-center/edu-center-vault/secrets-map|secrets-map]] — указатели на доступы (без значений).
- **market/** — [[edu-center/edu-center-vault/market/overview|ландшафт CRM для языковых школ]] + `competitors/`.
- **plans/** — [[edu-center/edu-center-vault/plans/README|роадмап продукта]].
- **tasks/** — [[edu-center/edu-center-vault/tasks/README|per-cycle run-data]].

## Зоны

- **systems/** — [[edu-center/edu-center-vault/systems/README|компоненты продукта]]; главная
  карточка — [[edu-center/edu-center-vault/systems/edu-center-app|edu-center-app]].
- **decisions/** · **lessons/** — прецеденты и операционные уроки
  ([[edu-center/edu-center-vault/decisions/README|decisions/README]] ·
  [[edu-center/edu-center-vault/lessons/README|lessons/README]]).
- **tools/** · **people/** · **clients/** · **analytics/** · **research/** —
  справочные/аналитические зоны, растут по мере надобности.
- **positioning.md** — [[edu-center/edu-center-vault/positioning|внешнее предложение продукта]].
- **_archive/** — терминальная зона (живых ссылок из канона нет).
