---
type: reference
status: active
sensitivity: normal
scope: all
axis: vault
updated: 2026-07-14
tags: [entry-points, navigation, map, claude-md, home-md, convention, namespace]
related:
  - meta-vault/HOME
  - meta-vault/principles
  - meta-vault/vault-template
  - CLAUDE.md
---

# Entry-point map — двери и карты неймспейса

Навигация сверху вниз: с верхнего уровня пройти к двери любого домена.

## Канон (в голове держать так)

**`CLAUDE.md` = дверь. `HOME.md` = карта. Цепочка: `CLAUDE.md → HOME.md → знание`.**

- **Дверь.** Харнесс **авто-грузит** её из cwd вверх по родителям. Обязательна в
  каждой папке-cwd: корень домена + каждый код-репо. Тонкая, стабильная: «где ты,
  как действовать, что читать первым». Имя зависит от харнесса: `CLAUDE.md`
  (Claude Code) / `AGENTS.md` (Codex) — папка под несколько тулов несёт оба как
  синхронные твины.
- **`HOME.md` — карта.** Харнесс её **не грузит** — на неё указывает дверь. Одна
  на корень vault. Семантическая навигация по темам.
- **`README.md` — человеку.** Опционально. Никогда не несёт нагрузку для
  агента — маршрутизация только в нём = баг (харнесс README не открывает).
- **`status.md` / `principles.md`** — не входы, но дверь/карта должны на них
  указывать в project-vault (горячее состояние + правила).
- **Проекция (`public/`)** — дверь + карта есть, **vault нет**: не источник,
  а выход. Отсутствие `-vault/` = признак проекции ([[meta-vault/glossary|glossary]]).

Легенда: `[door]` CLAUDE.md · `[map]` HOME.md · `[hot]` status.md ·
`[rules]` principles.md · `[human]` README.md · ✓ ок · ✗ пробел

## Карта

```
<корень>/  ◄══ верхний уровень (один репозиторий)
├─ CLAUDE.md                       [door] ✓  карта неймспейса
├─ meta-vault/HOME.md              [map]  ✓  + principles [rules] ✓ + preferences ✓
│                                            + vault-template ✓ (база-баз) + entry-points (этот файл)
├─ life/CLAUDE.md                  [door] ✓  + HOME.md [map] ✓ + principles ✓   (primary; дневник вне git)
├─ study/CLAUDE.md                 [door] ✓
│   └─ study-vault/HOME.md         [map]  ✓  + status ✓ + principles ✓
├─ creative/CLAUDE.md              [door] ✓
│   └─ creative-vault/HOME.md      [map]  ✓  + status ✓ + principles ✓
├─ ppu/CLAUDE.md                   [door] ✓  (private; код репо вне неймспейса)
│   └─ ppu-vault/HOME.md           [map]  ✓  + status ✓ + principles ✓ + secrets-map ✓
├─ chem-resale/CLAUDE.md           [door] ✓  (private; импорт ППУ Китай→KZ, независим от ppu)
│   └─ chem-resale-vault/HOME.md   [map]  ✓  + status ✓ + principles ✓ + secrets-map ✓
├─ edu-center/CLAUDE.md            [door] ✓  (private; продукт EduCenter CRM+ERP, код репо вне неймспейса)
│   └─ edu-center-vault/HOME.md    [map]  ✓  + status ✓ + principles ✓ + secrets-map ✓
├─ biz-knowledge/CLAUDE.md         [door] ✓  (private; бизнес-плейбук, дистиллят SHARKS → edustar)
│   └─ biz-knowledge-vault/HOME.md [map]  ✓  + status ✓ + principles ✓ + secrets-map ✓
├─ public/CLAUDE.md                [door] ✓  + HOME.md [map] ✓   (проекция, безагентная)
├─ documents/                      [human]    README (приёмник, вне git)
└─ secrets/                        [human]    README (вне git; NEVER commit)
```

## Реестр приведения к канону

Сюда записываются отклонения структуры от канона и их закрытие — чтобы пробел
был виден с верхнего уровня, а не обнаруживался при случайном заходе.

- [ ] `AGENTS.md`-твины дверей — не созданы; завести, если появится второй
  харнесс (Codex и т.п.).

## Почему это и есть учебный пример

«Дверь, которую видит машина» (`CLAUDE.md` авто-грузится) vs «карта, на которую
указывают» (`HOME.md`) — разница между **системой** (агент входит холодным и
сразу знает, что делать) и **разговором** (агент гадает).
