---
type: reference
status: active
sensitivity: private
scope: work
axis: vault
date: 2026-07-24
updated: 2026-07-24
tags: [home, map, chem-resale]
related:
  - principles
  - status
  - ../../meta-vault/vault-template
---

# chem-resale-vault

База знаний домена **импорта химкомпонентов ППУ** (Китай → Казахстан).
Семантическая карта — старт отсюда. Дверь — `../CLAUDE.md`. Соответствует
[[meta-vault/vault-template|meta-vault/vault-template]].

## Что это

Импортно-торговый бизнес: закупаем в Китае компоненты для пенополиуретана
(компонент А — полиол, компонент Б — изоцианат/MDI), везём и продаём в
Казахстане. Домен ведёт знание *о канале и сделках*: поставщики, покупатели,
логистика/таможня, юнит-экономика, регуляторика. **Независим от `ppu/`**
(разработка ppu-crm) — см. `../CLAUDE.md`.

## Обязательное

- [[chem-resale/chem-resale-vault/status|status]] — горячее состояние (читать каждую сессию).
- [[chem-resale/chem-resale-vault/principles|principles]] — конвенции (база + дельты).
- [[chem-resale/chem-resale-vault/secrets-map|secrets-map]] — указатели на доступы (без значений).
- **market/** — [[chem-resale/chem-resale-vault/market/overview|рынок сбыта KZ]] + `competitors/`.
- **plans/** — [[chem-resale/chem-resale-vault/plans/README|роадмап]] (сейчас: выстроить сорсинг).
- **tasks/** — [[chem-resale/chem-resale-vault/tasks/README|per-cycle run-data]].

## Зоны

- **systems/** — [[chem-resale/chem-resale-vault/systems/README|компоненты бизнеса]];
  главная — [[chem-resale/chem-resale-vault/systems/resale-pipeline|resale-pipeline]]
  (сорсинг → импорт → таможня → склад → сбыт).
- **people/** — [[chem-resale/chem-resale-vault/people/README|поставщики CN + покупатели KZ + брокер/логист]].
- **clients/** — [[chem-resale/chem-resale-vault/clients/README|покупатели в KZ]] (сбыт).
- **positioning.md** — [[chem-resale/chem-resale-vault/positioning|оффер покупателям]].
- **decisions/** · **lessons/** — прецеденты и операционные уроки
  ([[chem-resale/chem-resale-vault/decisions/README|decisions/README]] ·
  [[chem-resale/chem-resale-vault/lessons/README|lessons/README]]).
- **research/** — [[chem-resale/chem-resale-vault/research/README|разборы с TL;DR]]
  (регуляторика импорта химии: сертификация ЕАЭС, ТН ВЭД, опасный груз).
- **tools/** · **_archive/** — справочная и терминальная зоны.
