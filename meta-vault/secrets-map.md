---
title: Secrets map — где живут доступы (без значений)
updated: 2026-07-14
type: reference
status: active
sensitivity: normal
scope: all
tags: [secrets, security, access]
---

# Secrets map

Указатели, **без значений**. Паттерн: в трекаемых файлах никогда не лежат сами
секреты — только карта, *где* они живут. Машина доверенная → секреты можно
держать plain markdown, но NEVER sync / NEVER commit / NEVER index. Контракт:
`secrets/README.md` (в корне неймспейса; содержимое папки, кроме README,
не трекается).

## Глобальный личный уровень — `secrets/`

Доступы, которыми владеет владелец (не проект). Вне git через `.gitignore`
(+ рекомендован глобальный excludesfile).

- _(пусто — файлы появляются по мере надобности: passwords.md, tokens.md)_

## Per-project уровень

Доступы проекта — в его `.env` / `.secrets/`, никогда в трекаемых файлах.

- _(пусто — появятся с первыми код-проектами)_

## Локальные данные приложений (не секреты, но `private`)

Секретных значений тут нет, но это приватные поверхности доступа — фиксируем,
чтобы были видны с мета-уровня.

- **WhatsApp**, локальная **незашифрованная** база сообщений:
  `~/Library/Group Containers/group.net.whatsapp.WhatsApp.shared/ChatStorage.sqlite`.
  Доступ **только чтение** через снапшот-копию. Метод:
  [[meta-vault/tech/whatsapp/README|tech/whatsapp]]; решение:
  [[meta-vault/decisions/2026-07-20-whatsapp-local-readonly|2026-07-20]]. Экспорт
  → `life/inbox/whatsapp/` (вне git).

## Защита

- `.gitignore` корня: `secrets/*`, `*.env`, `*.key`, `id_*`.
- Рекомендация: глобальный git excludesfile `~/.config/git/ignore`
  (`core.excludesfile`) с теми же паттернами — защита в любом будущем репо.

## Долги

_(пусто)_
