---
type: reference
status: active
sensitivity: normal
scope: all
axis: vault
updated: 2026-07-14
tags: [schema, frontmatter, metadata, rag, lint]
---

# Frontmatter schema

Минимальный контракт для файлов, которые должны быть видимы агентам или
retrieval.

## Обязательно для индексируемых файлов vault

```yaml
---
type: reference | decision | idea | plan | method | model | corpus | tech-profile | run-retro | backlog | index
status: idea | proposed | accepted | active | superseded | archived
sensitivity: normal | private
scope: personal | work | all
tags: [hook1, hook2]
updated: YYYY-MM-DD
---
```

Для датированных артефактов, чья идентичность — дата события (решения, записи
дневника, ретро прогонов), вместо `updated` используется `date`. Файл может
нести оба поля, когда это полезно.

## Enum статусов

- `idea` — сырое зерно, ещё не оформлено настолько, чтобы на него опираться.
- `proposed` — связное предложение, ждёт решения.
- `accepted` — решение принято; может быть историческим, не действующим каноном.
- `active` — действующий операционный канон или живой индекс.
- `superseded` — заменён более новым объектом; хранится ради происхождения.
- `archived` — сохранённая запись, по умолчанию вне текущего retrieval.

Значения статусов на локальном языке в frontmatter не использовать.
Человеческая формулировка — в теле файла, если нужна.

## Sensitivity

- `normal` — безопасно для локального неймспейса и непубличной работы.
- `private` — может индексироваться локально, но никогда не уходит в публичный
  remote или публичный артефакт.

Инвариант — стена на выходе (egress): `private` не запрещает локальные
кросс-корпусные связи или локальный кросс-scope retrieval.

## Scope

- `personal` — личные корпуса, рефлексия, люди, таймлайн, приватные связи.
- `work` — проектное рабочее знание.
- `all` — кросс-доменный канон, оркестровка, контракты движка/метода.

`scope` говорит, для кого/чего объект. Это не метка приватности — для неё
есть `sensitivity`.

## Trust

`trust: primary | derived` принадлежит только объектам данных/содержимого,
не операционным докам. Использовать для корпусов, извлечённых артефактов,
личных синтезов. Не добавлять `trust` в `principles`, `preferences`, `schema`
и прочие операционные контракты.

## Опциональные уточнители

```yaml
axis: vault | agentic | engine | cross
layer: base | meta | hybrid   # только вместе с axis: agentic
related:
  - path/or/wiki-link
```

Использовать только там, где они снимают неоднозначность.
