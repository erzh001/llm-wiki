---
type: reference
status: active
sensitivity: private
scope: work
date: 2026-07-20
updated: 2026-07-20
tags: [lesson, nextjs, ppu-crm]
related:
  - ../systems/ppu-crm-app
---

# lesson — Next.js 16 ломает привычки (читать доки в node_modules)

**Триггер:** пишешь код в репо ppu-crm (Next.js 16).

**Правило:** до правок читать актуальные гайды в
`node_modules/next/dist/docs/`; не полагаться на память о прежних версиях
Next.js. Учитывать deprecation-нотисы.

**Почему:** репо несёт собственный `AGENTS.md` с явным предупреждением — эта
версия имеет ломающие изменения (API, конвенции, файловая структура могут
отличаться от того, что «знает» модель по обучению).
