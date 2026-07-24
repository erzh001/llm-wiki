---
title: WhatsApp source — tech-профиль read-only коннектора
type: tech-profile
status: active
sensitivity: normal
scope: personal
axis: engine
tags: [whatsapp, source-connector, sqlite, core-data, read-only, method]
updated: 2026-07-20
related:
  - ../../decisions/2026-07-20-whatsapp-local-readonly
  - ../../../life/inbox/whatsapp/README
  - ../README
---

# WhatsApp source (read-only)

Источник-коннектор: **входящее зеркало** личной переписки WhatsApp в неймспейс.
Метод — источник правды (durable markdown); скрипт `wa-read.sh` рядом — лишь
регенерируемое удобство. Решение и инварианты:
[[meta-vault/decisions/2026-07-20-whatsapp-local-readonly|decision]].

## Где данные

Нативное приложение (App Store), macOS. База Core Data, **не зашифрована**:

```
~/Library/Group Containers/group.net.whatsapp.WhatsApp.shared/ChatStorage.sqlite
```

Сопутствующие: `-wal` / `-shm` (открытые транзакции). Копировать все три.

## Инварианты доступа

- **Только чтение.** Никогда не пишем в базу приложения.
- Работаем со **снапшот-копией** в `/tmp` (эфемерна, чистится на выходе).
- Экспорт → `life/inbox/whatsapp/` — `private`, `trust: derived`, вне git.

## Схема (ключевое)

| Таблица | Роль |
|---|---|
| `ZWAMESSAGE` | сообщения |
| `ZWACHATSESSION` | чаты/контакты |
| `ZWAMEDIAITEM` | медиа (файлы отдельно, тут метаданные) |
| `ZWAGROUPMEMBER` / `ZWAGROUPINFO` | группы и участники |

`ZWAMESSAGE`: `ZTEXT` (текст), `ZISFROMME` (1 = я), `ZMESSAGEDATE` (дата
Core Data), `ZPUSHNAME` (имя отправителя в группе), `ZFROMJID`/`ZTOJID`,
`ZCHATSESSION` → `ZWACHATSESSION.Z_PK`.

`ZWACHATSESSION`: `ZPARTNERNAME` (имя чата), `ZCONTACTJID`, `ZMESSAGECOUNTER`,
`ZLASTMESSAGEDATE`, `ZLASTMESSAGETEXT`.

**Дата Core Data → локальное время:**
`datetime(ZMESSAGEDATE + 978307200, 'unixepoch', 'localtime')`
(смещение = секунды между 2001-01-01 и эпохой Unix).

## Помощник

`wa-read.sh` (рядом с этим файлом) — read-only, сам делает снапшот и чистит его:

```
./wa-read.sh chats [N]          # топ N чатов по активности
./wa-read.sh recent <чат> [N]   # последние N сообщений из чата (по части имени)
./wa-read.sh search <слово> [N] # поиск по тексту во всех чатах
./wa-read.sh export <чат>       # весь диалог в markdown (stdout)
```

Экспорт направлять в приватную зону, напр.:
`./wa-read.sh export "Имя" > ../../../life/inbox/whatsapp/imya.md`

## Ограничения

- **Снимок**: свежесть = синхронизации десктоп-приложения с телефоном.
- Медиа — отдельные файлы; здесь только текст и метаданные.
- **Имена в группах**: `ZWAGROUPMEMBER.ZCONTACTNAME` часто пуст → отдаётся
  `ZMEMBERJID` (`…@lid`). Настоящие имена — в отдельной `ContactsV2.sqlite`
  (не подключаем, пока не понадобится). В личных чатах отправитель — стрелка/имя чата.
- Массовый экспорт не делаем по умолчанию — только по запросу владельца.
