# MySDD — spec-driven development for AI coding agents

Seven reusable prompts that run a whole project. All state lives in your
repo's `specs/` — the prompts carry no information, they just say *"read the
specs, do the next bit, update the paper."* The specs are the memory: any
session, any agent, same buttons.

```
0 WHAT-DO-I-DO ─► 1 CONSTITUTION ─► ┌► 3 SPEC PHASE ─► 4 NEXT TASK ×N ─┐
                  (or 1 ADOPT)      └────────── next phase ◄───────────┘
        2 ADJUST-LATER / 5 ADJUST-NOW ── when something changes, anytime

stop when: specs/roadmap.md shows every phase ✅
```

| Order | Skill | Raw prompt | When |
| --- | --- | --- | --- |
| 0 | [/what-do-i-do](skills/what-do-i-do/SKILL.md) | [what-do-i-do](prompts/00-what-do-i-do.md) | every fresh session — read-only, says what to run |
| 1 | [/constitution](skills/constitution/SKILL.md) | [constitution](prompts/01-constitution.md) | once per project — new codebase |
| 1 | [/adopt](skills/adopt/SKILL.md) | [adopt](prompts/06-adopt.md) | once per project — existing codebase, instead of /constitution |
| 2 | [/spec-phase](skills/spec-phase/SKILL.md) | [spec-phase](prompts/03-spec-phase.md) | once per phase |
| 3 | [/next-task](skills/next-task/SKILL.md) | [next-task](prompts/04-next-task.md) | per task group, until the phase closes |
| — | [/adjust-later](skills/adjust-later/SKILL.md) | [adjust-later](prompts/02-adjust-later.md) | a future decision changes — plans propagate, code waits |
| — | [/adjust-now](skills/adjust-now/SKILL.md) | [adjust-now](prompts/05-adjust-now.md) | "change this now" — built immediately, docs in lockstep |

## Vocabulary

- **Constitution** — `specs/mission.md` + `tech-stack.md` + `roadmap.md`: the
  rules that rarely change (why, how, in what order — in very small phases).
- **Phase** — a slice of the product. Own spec folder (`requirements.md`,
  `plan.md`, `validation.md`); ✅ on the roadmap when validation is all green.
- **Task group** — a slice of a phase. One sitting, one green commit. The
  roadmap counts phases; `git log` counts task groups.
- **Adjust-later / adjust-now** — the two change flows, split by time.
  *Later*: a future requirement or re-decision — constitution, roadmap and
  open phase specs get propagated; code catches up when the groups are
  built (huge blast radius → becomes a migration phase, not a giant turn).
  *Now*: an immediate change to existing work — implemented right away
  (gate green, user confirms, commit) with constitution and specs updated
  in the same motion. Both trigger from plain words; the slash is a backup.

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
you:   We are writing DetEval, a repo to evaluate an object-detection model:
       run inference, benchmark against ground truth, retrain on
       auto-generated data, all runnable on VMs. The brief with stakeholder
       input is in specs/brief.md.
you:   /constitution
agent: asks 3 grouped questions (metrics? stack? build order?)
       → specs/mission.md · tech-stack.md (Python, PyTorch, Docker) ·
         roadmap.md: 0 boot · 1 inference · 2 eval vs GT · 3 run on VMs ·
         4 auto-generated data · 5 retraining · 6 benchmark report

you:   /spec-phase
agent: asks 3 grouped questions (scope? plan shape? validation gate?)
       → specs/2026-07-14-eval-vs-gt/{plan,requirements,validation}.md
you:   /next-task     → 2.1 GT loader + box matching   green, commit
you:   /next-task     → 2.2 mAP / PR metrics           green, commit
you:   /next-task     → 2.3 report + validation pass   → Phase 2 ✅

day N — fresh session, a decision changed
you:   /what-do-i-do
agent: phases 0–2 ✅ · phase 3 not specced · gate green → run /spec-phase
you:   /adjust-later retraining uses auto-generated labels, not hand labels
agent: constitution updated · Phase 4 spec rewritten (assumed hand labels) —
       nothing to build now, the retraining group picks it up
you:   rename the eval report to benchmark.md and add a --csv flag
agent: (adjust-now) done — gate green, README + phase spec updated · confirm?

you:   /spec-phase … /next-task ×N … repeat until every phase is ✅
```

Any fresh session can continue from any point — the specs carry the state.

Other agents: `skills/*/SKILL.md` is the open Agent Skills format — plain
markdown, paste it anywhere or wire it as your tool's custom commands;
`prompts/` holds the raw copy-paste versions.
