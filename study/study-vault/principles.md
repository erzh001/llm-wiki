---
type: reference
status: active
sensitivity: normal
scope: work
date: 2026-07-14
updated: 2026-07-14
tags: [principles, conventions, deltas]
related:
  - ../../meta-vault/principles
  - ../../meta-vault/vault-template
---

# Принципы — study (дельты)

Следует **базе**: [[meta-vault/principles|meta-vault/principles]] +
[[meta-vault/vault-template|meta-vault/vault-template]]. Здесь — только дельты.

## Дельты

- **Нет зоны `market/`** — учёба не бизнес; обязательная по шаблону `market/`
  дропнута этой дельтой (сам шаблон разрешает дельты через principles).
- **Добавлена зона `notes/`** — конспекты: один файл = одна тема, имя =
  search-hook.
- **Файлы-материалы по указателю.** PDF/учебники → `documents/` в корне
  неймспейса (вне git); vault держит карточку (что это, где, зачем).
- **Язык.** Конспекты — на языке, на котором владелец думает об этом предмете;
  инфраструктура — по базовому правилу.
