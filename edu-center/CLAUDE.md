# edu-center — разработка продукта EduCenter CRM+ERP (дверь)

Ты в `edu-center/` — рабочий домен **разработки продукта EduCenter CRM+ERP**:
multi-tenant SaaS (CRM+ERP) для сети школ английского языка. Домен ведёт знание
*о разработке продукта*: архитектура, роадмап, техрешения, бизнес-правила,
уроки. Рабочий домен, соседи `ppu/` / `chem-resale/` / `study/` / `creative/`;
создан из [[meta-vault/vault-template|vault-template]].

> ⚠️ **Не путать с `ppu/`.** Оба — разработка софта (CRM/ERP), но разные
> продукты, разные репозитории, разные бизнесы: `ppu/` — ERP для
> производственного бизнеса (Next.js 16); этот — SaaS для языковых школ
> (Fastify). Кросс-ссылок между доменами не заводим.

Имя агенту уровня не присвоено (реестр имён: [[meta-vault/glossary|glossary]]).

Читать первым (мозг — это vault):
- `edu-center-vault/status.md` — текущее состояние, читать каждую сессию.
- `edu-center-vault/principles.md` — конвенции (база + дельты).
- `edu-center-vault/HOME.md` — карта знания.

> **Инвариант (все уровни):** НИКОГДА не использовать `AskUserQuestion` /
> попап-диалоги с выбором — вопросы владельцу всегда обычным текстом.

## Стадия

**Скелет vault + карточка кода.** Продукт уже большой (multi-tenant бэкенд ~6.4k
строк, фронт ~5.4k, 34 Prisma-модели, ~128 endpoints, RLS, auth с MFA). Здесь —
скелет vault и указатель на репозиторий; архитектура/решения наполняются от
факта, не выдумываются заранее. Живые блокеры — в `status.md`.

## Где живёт код (НЕ здесь)

Код продукта — **отдельный репозиторий вне этого неймспейса**, со своим git:

- Путь: `/Users/erzhanmoldagaliev/Sites/edu-center`
- В llm-wiki репо **не втягивается** (свой git, node_modules, Docker, секреты).
  Здесь — только карточка-указатель + знание о нём.
- Карточка системы:
  [[edu-center/edu-center-vault/systems/edu-center-app|systems/edu-center-app]].

> ⚠️ Репо несёт собственный `CLAUDE.md` — главный технический контекст
> (архитектура, ERD, API-map, бизнес-правила). Перед кодом читать его, а не
> эту дверь: здесь — знание *о продукте*, там — правда *о коде*.

## Внутри

- `edu-center-vault/` — база знаний (см. HOME).
- Что за продукт: SaaS для языковых школ, каждый tenant = школа; роли от
  `superadmin` до `student/parent`; ядро — students/schedule/finance/CRM +
  «конкурентные» фичи (loyalty, payroll, referral, waitlist, online-payments).
  Верхний срез — `systems/edu-center-app.md`.
- Секреты продукта (`.env`, JWT-секреты, S3/Twilio/SMTP ключи) остаются в репо
  `edu-center` / `secrets/` — здесь только указатели
  ([[edu-center/edu-center-vault/secrets-map|secrets-map]]).

> Карта: [[edu-center/edu-center-vault/HOME|HOME]] · верх:
> [[CLAUDE|карта неймспейса]]
