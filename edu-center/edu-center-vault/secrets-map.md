---
type: reference
status: active
sensitivity: private
scope: work
date: 2026-07-24
updated: 2026-07-24
tags: [secrets-map, pointers]
related:
  - HOME
  - ../../meta-vault/secrets-map
---

# Карта секретов — edu-center

Только указатели, никогда значения (базовое правило).

Доступы продукта живут **в репозитории EduCenter**, не здесь и не в трекаемых
файлах llm-wiki:

- `edu-center/backend/.env` — БД (PostgreSQL), Redis, JWT access/refresh
  секреты, S3/MinIO ключи, Twilio (SMS), TOTP issuer. Образец без значений:
  `edu-center/backend/.env.example`.
- `edu-center/frontend/.env` — фронтовые переменные. Образец:
  `edu-center/frontend/.env.example`.
- `edu-center/.env.prod.example` — образец prod-переменных (без значений).

NEVER commit / sync / index реальные `.env` — только `.example`-образцы.

Глобальная карта: [[meta-vault/secrets-map|meta-vault/secrets-map]].
