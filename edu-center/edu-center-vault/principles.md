---
type: reference
status: active
sensitivity: private
scope: work
date: 2026-07-24
updated: 2026-07-24
tags: [principles, conventions, deltas]
related:
  - ../../meta-vault/principles
  - ../../meta-vault/vault-template
---

# Принципы — edu-center (дельты)

Следует **базе**: [[meta-vault/principles|meta-vault/principles]] +
[[meta-vault/vault-template|meta-vault/vault-template]]. Здесь — только дельты.

## Дельты

- **Код — вне неймспейса, по указателю.** Репозиторий EduCenter
  (`/Users/erzhanmoldagaliev/Sites/edu-center`) не втягивается в llm-wiki: свой
  git, node_modules, Docker, секреты. Vault держит карточку-указатель
  ([[edu-center/edu-center-vault/systems/edu-center-app|systems/edu-center-app]]),
  не копию кода. Правда о коде — в коде (там свой `CLAUDE.md`); vault хранит
  *знание о нём* (архитектура, решения, уроки), которое переживёт репо.
- **`market/` = ландшафт продукта, не бизнес-рынок.** Обязательную по шаблону
  зону трактуем как конкурентный ландшафт CRM для языковых школ/EdTech (чем
  EduCenter отличается), а не как рынок сбыта.
- **`sensitivity: private` по умолчанию.** Домен и его данные (tenant'ы,
  студенты, платежи, переписка — всё, что течёт через продукт) в git не для
  публики; репозиторий держать приватным.
- **Секреты только указателями.** `.env`, JWT-секреты, S3/Twilio/SMTP-ключи
  остаются в репо `edu-center` / `secrets/`; здесь —
  [[edu-center/edu-center-vault/secrets-map|secrets-map]], без значений.
- **`clients/` = школы-tenant'ы, не конечные ученики.** Клиент продукта — школа
  (B2B SaaS); ученики/родители — пользователи внутри tenant'а. Зону `clients/`
  ведём про школы-заказчики, если появятся реальные.
- **`curriculum/` не заведена** — образование ведут школы-tenant'ы, не сам
  продукт; появится дельтой, если понадобится.
- **Язык.** Инфраструктура (двери, принципы, README, решения) — по базовому
  правилу; технические заметки — на языке, на котором владелец думает о коде.
