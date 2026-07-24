---
type: reference
status: active
sensitivity: private
scope: work
date: 2026-07-20
updated: 2026-07-20
tags: [principles, conventions, deltas]
related:
  - ../../meta-vault/principles
  - ../../meta-vault/vault-template
---

# Принципы — ppu (дельты)

Следует **базе**: [[meta-vault/principles|meta-vault/principles]] +
[[meta-vault/vault-template|meta-vault/vault-template]]. Здесь — только дельты.

## Дельты

- **Код — вне неймспейса, по указателю.** Репозиторий ppu-crm
  (`/Users/erzhanmoldagaliev/Sites/ppu-crm`) не втягивается в llm-wiki: свой
  git, node_modules, боевой воркер, секреты. Vault держит карточку-указатель
  ([[ppu/ppu-vault/systems/ppu-crm-app|systems/ppu-crm-app]]), не копию кода.
  Правда о коде — в коде; vault хранит *знание о нём* (архитектура, решения,
  уроки), которое переживёт репо.
- **`market/` = ландшафт продукта, не бизнес-рынок.** Обязательную по шаблону
  зону трактуем как конкурентный ландшафт CRM/ERP-продуктов (чем ppu-crm
  отличается), а не как рынок сбыта.
- **`sensitivity: private` по умолчанию.** Домен и его данные (клиенты,
  поставщики, финансы, HR — всё, что течёт через продукт) в git не для публики;
  репозиторий держать приватным.
- **Секреты только указателями.** `.env`, WhatsApp-сессия (`.wwebjs_auth`),
  ключи БД/почты остаются в репо ppu-crm / `secrets/`; здесь —
  [[ppu/ppu-vault/secrets-map|secrets-map]], без значений.
- **`curriculum/` не заведена** — не образовательная деятельность; появится
  дельтой, если понадобится.
- **Язык.** Инфраструктура (двери, принципы, README, решения) — по базовому
  правилу; технические заметки — на языке, на котором владелец думает о коде.
