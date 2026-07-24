---
type: reference
status: active
sensitivity: private
scope: work
date: 2026-07-20
updated: 2026-07-20
tags: [secrets-map, pointers]
related:
  - HOME
  - ../../meta-vault/secrets-map
---

# Карта секретов — ppu

Только указатели, никогда значения (базовое правило).

Доступы продукта живут **в репозитории ppu-crm**, не здесь и не в трекаемых
файлах llm-wiki:

- `ppu-crm/.env` — БД (libSQL/Turso), почта (IMAP/SMTP), ключи, next-auth
  секрет. Образец без значений: `ppu-crm/.env.example`.
- `ppu-crm/.wwebjs_auth/` — сохранённая сессия WhatsApp (`whatsapp-web.js`).
  NEVER commit / sync / index.

Глобальная карта: [[meta-vault/secrets-map|meta-vault/secrets-map]].
