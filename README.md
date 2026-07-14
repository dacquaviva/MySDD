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
cd MySDD && ./install.sh        # Claude Code, global (~/.claude/skills)
# or per-project, shared with teammates:
cp -r skills <your-project>/.claude/skills
```

Other agents: `skills/*/SKILL.md` is the open Agent Skills format — plain
markdown, paste it anywhere or wire it as your tool's custom commands;
`prompts/` holds the raw copy-paste versions.
