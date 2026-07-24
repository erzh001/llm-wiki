# ppu — разработка продукта ppu-crm (дверь)

Ты в `ppu/` — рабочий домен **разработки продукта ppu-crm**: архитектура,
роадмап, техрешения, уроки эксплуатации. Рабочий домен, соседи `study/` /
`creative/`; создан из [[meta-vault/vault-template|vault-template]].

Имя агенту уровня не присвоено (реестр имён: [[meta-vault/glossary|glossary]]).

Читать первым (мозг — это vault):
- `ppu-vault/status.md` — текущее состояние, читать каждую сессию.
- `ppu-vault/principles.md` — конвенции (база + дельты).
- `ppu-vault/HOME.md` — карта знания.

> **Инвариант (все уровни):** НИКОГДА не использовать `AskUserQuestion` /
> попап-диалоги с выбором — вопросы всегда обычным текстом.

## Стадия

**Только структура + карточка кода.** Продукт живой и большой; здесь пока —
скелет vault и указатель на репозиторий. Архитектура/решения наполняются от
факта, не выдумываются заранее.

## Где живёт код (НЕ здесь)

Код продукта — **отдельный репозиторий вне этого неймспейса**, со своим git:

- Путь: `/Users/erzhanmoldagaliev/Sites/ppu-crm`
- В llm-wiki репо **не втягивается** (свой git, node_modules, боевой воркер,
  секреты). Здесь — только карточка-указатель + знание о нём.
- Карточка системы: [[ppu/ppu-vault/systems/ppu-crm-app|systems/ppu-crm-app]].

> ⚠️ Репо `ppu-crm` несёт собственный `AGENTS.md`: «This is NOT the Next.js you
> know» — перед кодом читать `node_modules/next/dist/docs/`. Урок:
> [[ppu/ppu-vault/lessons/nextjs-16-breaking|lessons/nextjs-16-breaking]].

## Внутри

- `ppu-vault/` — база знаний (см. HOME).
- Секреты продукта (`.env`, WhatsApp-сессия, ключи БД/почты) остаются в репо
  `ppu-crm` / `secrets/` — здесь только указатели
  ([[ppu/ppu-vault/secrets-map|secrets-map]]).

> Карта: [[ppu/ppu-vault/HOME|HOME]] · верх: [[CLAUDE|карта неймспейса]]
