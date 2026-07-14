---
type: index
status: active
sensitivity: normal
scope: all
axis: vault
updated: 2026-07-14
tags: [schema, frontmatter, contracts, rag]
---

# schema/

Machine-facing контракты meta-vault.

Эта папка — не канон в смысле «финальная правда». Это действующий контракт,
благодаря которому люди, агенты, линтеры и движок retrieval (если подключён)
интерпретируют файлы одинаково. Когда практика меняется — сначала обновляется
схема, потом мигрируют файлы.

## Контракты

- [[meta-vault/schema/frontmatter|Frontmatter schema]] — обязательные поля,
  enum статусов и семантика метаданных для retrieval.

## Правило

Правила могут жить и пересматриваться, но каждое операционное правило,
влияющее на retrieval, должно оставлять machine-readable след: поле, enum,
запись-источник или конвенцию ссылок.
