---
type: reference
status: active
sensitivity: private
scope: work
axis: vault
date: 2026-07-28
updated: 2026-07-28
tags: [home, map, ppu-manufacturing]
related:
  - principles
  - status
  - ../../meta-vault/vault-template
---

# ppu-manufacturing-vault

База знаний домена **производства предизолированных труб ППУ** (проект «teplocom»).
Семантическая карта — старт отсюда. Дверь — `../CLAUDE.md`. Соответствует
[[meta-vault/vault-template|meta-vault/vault-template]].

## Что это

Физическое производство: изготовление трубы «сталь + ППУ-изоляция + ПЭ-оболочка»,
цех, оборудование, поставки сырья/энергии/газов, сбыт готовой трубы. Домен ведёт
знание *о производстве, оборудовании, себестоимости и сбыте*. Сырьё (полиол/MDI)
приходит из [[chem-resale/chem-resale-vault/HOME|chem-resale]] (вход→производство).

## Обязательное

- [[ppu-manufacturing/ppu-manufacturing-vault/status|status]] — горячее состояние.
- [[ppu-manufacturing/ppu-manufacturing-vault/principles|principles]] — конвенции (база + дельты).
- [[ppu-manufacturing/ppu-manufacturing-vault/secrets-map|secrets-map]] — указатели на доступы.

## Зоны

- [[ppu-manufacturing/ppu-manufacturing-vault/overview|overview]] — что за
  производство, что распознано из чатов, что уточнить.
- **systems/** — производственная цепочка, оборудование (появится).
- **people/** — партнёр по ТОО, поставщики газов/энергии, покупатели (появится).
- **market/** · **positioning.md** · **decisions/** · **lessons/** — по надобности.

> Источник сидирования — [[meta-vault/inbox/claude-ai-chats|claude.ai-чаты]]
> (кластер «производство/промышленность») + память об операции. Углублять вытягиванием чатов.
