# MySDD — spec-driven development for AI coding agents

Five reusable prompts that run a whole project. All state lives in your
repo's `specs/` — the prompts carry no information, they just say *"read the
specs, do the next bit, update the paper."* The specs are the memory: any
session, any agent, same buttons.

```
0 ORIENT ─► 1 CONSTITUTION ─► ┌► 3 SPEC PHASE ─► 4 NEXT TASK ×N ─┐
                              └────────── next phase ◄───────────┘
        2 AMEND / 5 SYNC ── when a decision changes

stop when: specs/roadmap.md shows every phase ✅
```

| Order | Skill | Raw prompt | When |
| --- | --- | --- | --- |
| 0 | — (just a first message) | [orient](prompts/00-orient.md) | once |
| 1 | [/constitution](skills/constitution/SKILL.md) | [constitution](prompts/01-constitution.md) | once per project |
| 2 | [/spec-phase](skills/spec-phase/SKILL.md) | [spec-phase](prompts/03-spec-phase.md) | once per phase |
| 3 | [/next-task](skills/next-task/SKILL.md) | [next-task](prompts/04-next-task.md) | per task group, until the phase closes |
| — | [/amend](skills/amend/SKILL.md) | [amend](prompts/02-amend.md) | a decision changes |
| — | [/sync](skills/sync/SKILL.md) | [sync](prompts/05-sync.md) | an amend reported ripples |

## Vocabulary

- **Constitution** — `specs/mission.md` + `tech-stack.md` + `roadmap.md`: the
  rules that rarely change (why, how, in what order — in very small phases).
- **Phase** — a slice of the product. Own spec folder (`requirements.md`,
  `plan.md`, `validation.md`); ✅ on the roadmap when validation is all green.
- **Task group** — a slice of a phase. One sitting, one green commit. The
  roadmap counts phases; `git log` counts task groups.
- **Amend / sync** — change a rule / fix what the new rule broke. Huge blast
  radius? Don't sync in one giant turn — add a migration phase instead.

## Install

```sh
git clone git@github.com:dacquaviva/MySDD.git
cd MySDD && ./install-claude-code.sh
```

The script symlinks each skill into `~/.claude/skills`, where Claude Code
looks — after that, the slash commands exist in every project on the machine,
and a `git pull` here updates them everywhere.

## Example session

```
day 1 — new project
you:   We are writing RecipeBox, a place to store family recipes.
       Look in the README.md for input from stakeholders.
you:   /constitution
agent: asks 3 grouped questions (tone? stack? build order?)
       → writes specs/mission.md, tech-stack.md, roadmap.md (phases 0–4)

you:   /spec-phase
agent: asks 3 grouped questions (scope? plan shape? validation gate?)
       → writes specs/2026-07-14-boot/{plan,requirements,validation}.md
you:   /next-task     → 0.1 toolchain        green, commit
you:   /next-task     → 0.2 server + page    green, commit
you:   /next-task     → 0.3 validation pass  → Phase 0 ✅ on the roadmap

day 2 — a decision changes
you:   /amend we store recipes in SQLite
agent: constitution updated — "no ripples, nothing built uses storage yet"

you:   /spec-phase … /next-task ×N … repeat until every phase is ✅
```

Any fresh session can continue from any point — the specs carry the state.

Other agents: `skills/*/SKILL.md` is the open Agent Skills format — plain
markdown, paste it anywhere or wire it as your tool's custom commands;
`prompts/` holds the raw copy-paste versions.
