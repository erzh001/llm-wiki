---
type: reference
status: active
sensitivity: normal
scope: all
tags: [home, index, vault, map]
updated: 2026-07-14
---

# meta-vault

meta-vault верхнего level'а: vault *о самом неймспейсе* — связи **вниз** ко всем
доменам. Семантическая карта — начинать отсюда. Конвенции —
[[meta-vault/principles|principles]]. Растёт по мере надобности, один файл =
один объект.

> Карта неймспейса и роли — `../CLAUDE.md`. Новые домены рождаются из
> [[meta-vault/vault-template|vault-template]].

---

## Домены (связи вниз)

Личное (`trust` указан):

- **`../life/`** — живой первоисточник: дневник, тексты. `primary`.
  Содержимое дневника вне git.

Работа (домены-пиры, примеры — замени своими):

- **`../study/`** — учёба: предметы, конспекты, задачи. Дверь + `study-vault/`.
- **`../creative/`** — творчество: работы, инструменты, релизы. Дверь +
  `creative-vault/` + `media/` (файлы вне git).
- **`../ppu/`** — разработка продукта ppu-crm (ERP/CRM). Дверь + `ppu-vault/`.
  `private`; код репо — вне неймспейса (`Sites/ppu-crm`, указатель в vault).
- **`../chem-resale/`** — импорт компонентов ППУ (Китай→Казахстан), перепродажа.
  Дверь + `chem-resale-vault/`. `private`; независим от `ppu/` (общий только
  товар, не бизнес).
- **`../edu-center/`** — разработка продукта EduCenter CRM+ERP (SaaS для
  языковых школ). Дверь + `edu-center-vault/`. `private`; код репо — вне
  неймспейса (`Sites/edu-center`, указатель в vault). Отдельный продукт/бизнес,
  не путать с `ppu/`.
- **`../biz-knowledge/`** — бизнес-знания: дистиллированный плейбук (стратегия,
  оргдизайн, продажи, маркетинг, юнит-экономика). Источник — SHARKS (школа
  плавания), назначение — адаптация под edustar (`edu-center`). Дверь +
  `biz-knowledge-vault/`. `private`; raw-источники (борды Miro, видео) — вне git.
  Единственный домен с разрешённой кросс-ссылкой в `edu-center/` (это его цель).

Проекции (выходы поперёк доменов):

- **`../public/`** — внешние готовые артефакты. Карта: `../public/HOME.md`.

## Tech (кросс-проектная память)

- [[meta-vault/tech/README|tech/]] — tech-профили проектов (стек, архитектура,
  переиспользуемые блоки). Первый:
  [[meta-vault/tech/whatsapp/README|whatsapp/]] — read-only источник-коннектор
  (локальная база WhatsApp + `wa-read.sh`).

## Decisions

- [[meta-vault/decisions/README|decisions/]] — датированные прецеденты
  `YYYY-MM-DD-*`. Первое:
  [[meta-vault/decisions/2026-07-20-whatsapp-local-readonly|WhatsApp read-only]].

## Backlog + inbox (задачи: кратко на мете, решаются ниже)

- [[meta-vault/inbox/README|inbox/]] — одна дверь захвата: кидай что угодно,
  zero ceremony.
- [[meta-vault/backlog|Backlog]] — **реестр**: все живые пункты одной строкой
  (суть · исполнитель · указатель вниз). Разбирается регулярной сессией:
  inbox → проход реестра → свод.

## Plans

- [[meta-vault/plans/README|plans/]] — полка стратегических сборок (не
  календарные обязательства; обязательства ведёт [[meta-vault/backlog|backlog]]).

## Ideas (будущие улучшения, открытые вопросы)

- [[meta-vault/ideas/README|ideas/]] — forward-looking предложения мета-уровня,
  отдельно от устоявшихся decisions. Пусто.

## Learning queue (личный уровень развития владельца)

- [[meta-vault/learning-queue/README|learning-queue/]] — новые слова/концепты
  для расширения семантики владельца как пользователя-человека. Агент кладёт
  сам или по просьбе; разбирает владелец выделенной сессией.

## People

- [[meta-vault/people/README|people/]] — реестр идентичностей: карточка на
  человека из ≥2 доменов. Пусто.

## Meta

- [[meta-vault/glossary|Glossary]] — канон терминов: две оси (level vs
  stream/flow) + RU-алиасы.
- [[meta-vault/vault-template|Vault template]] — база-баз: «папка = точка
  входа», контракт дверь/карта, скелет project-vault. Новые домены рождаются
  отсюда.
- [[meta-vault/entry-points|Entry-point map]] — двери (`CLAUDE.md`) и карты
  (`HOME.md`) всего неймспейса.
- [[meta-vault/schema/README|Schema]] — machine-facing контракты frontmatter.
- [[meta-vault/preferences|Preferences]] — принципы верхнего уровня
  (оркестратор) + инвариант.
- [[meta-vault/secrets-map|Secrets map]] — где живут доступы (без значений).
- [[meta-vault/principles|Principles]] — правила vault.
- [[meta-vault/session-close|Session-close]] — протокол завершения сессии:
  ритуал закрытия записей уровня (status/карта/backlog) + опциональный хук.

---

См. также: карта неймспейса `../CLAUDE.md`.
