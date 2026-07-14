# MySSD — a tiny spec-driven development kit for AI coding agents

Five prompts that run a whole project, in a loop. The core idea of SDD:
**the state of the project lives in files, not in the chat.** Every decision
is written into your repo's `specs/`, so the agent always has something
stable to check its work against — and to be checked against. That's why the
prompts can be generic and repetitive: they carry no information, they just
say *"read the specs, do the next bit, update the paper."* Close the session,
open a fresh one tomorrow, press the same button — **the specs are the
memory.**

## The loop

```
0 ORIENT ─► 1 CONSTITUTION ─► ┌► 3 SPEC PHASE ─► 4 IMPLEMENT ×N ─┐
                              └────────── next phase ◄───────────┘
        2 AMEND / 5 SYNC ── whenever a decision changes, keep the paper true

stop when: specs/roadmap.md shows every phase ✅
```

## Order of execution

| # | Step | Prompt | Claude skill | When |
| --- | --- | --- | --- | --- |
| 0 | Orient | [00-orient](prompts/00-orient.md) | — first chat message | once |
| 1 | Constitution | [01-constitution](prompts/01-constitution.md) | [/constitution](adapters/claude/skills/constitution/SKILL.md) | once per project |
| 3 | Spec a phase | [03-spec-phase](prompts/03-spec-phase.md) | [/spec-phase](adapters/claude/skills/spec-phase/SKILL.md) | once per phase |
| 4 | Implement | [04-next-task](prompts/04-next-task.md) | [/next-task](adapters/claude/skills/next-task/SKILL.md) | once per task group, until the phase closes |
| 2 | Amend | [02-amend](prompts/02-amend.md) | [/amend](adapters/claude/skills/amend/SKILL.md) | anytime a decision changes |
| 5 | Sync | [05-sync](prompts/05-sync.md) | [/sync](adapters/claude/skills/sync/SKILL.md) | after an amend that reported ripples |

What each step produces:

1. **Constitution** — the rules that rarely change: *why* you're building
   (`mission.md`), *how* (`tech-stack.md`), *in what order* (`roadmap.md`,
   split into very small phases).
2. **Spec a phase** — a dated folder `specs/YYYY-MM-DD-<feature>/` with three
   docs: `requirements.md` (in/out of scope + decisions), `plan.md` (the
   phase as small numbered task groups), `validation.md` (how you'll know
   it's done).
3. **Implement** — one task group at a time: keep it green, commit, tick the
   boxes. When `validation.md` is all green, the phase gets ✅ on the roadmap
   — and you go back to *spec a phase*.

## Phase vs task group

- **Phase** — a slice of the *product*. Lives on the roadmap, owns a spec
  folder and a validation gate; closes ✅ when all green. *"The app has
  payments now."*
- **Task group** — a slice of a *phase*. Lives in that phase's `plan.md`;
  one sitting of work, one green commit. *"The checkout route exists now."*

```
Phase 3 — Payments            ← roadmap line, spec folder, validation gate
 ├─ 3.1 provider client       ← one green commit
 ├─ 3.2 checkout route        ← one green commit
 └─ 3.3 receipts + close ✅    ← one green commit
```

Rule of thumb: a phase is worth **speccing** (it changes what the product is,
so it needs paper: scope, decisions, done-criteria); a task group is worth
**committing** (the next concrete step, small enough to review as one diff).
The roadmap counts phases; `git log` counts task groups.

## When a decision changes

1. **Amend** — state it in plain language; the constitution gets updated and
   the agent reports the *blast radius* (what now contradicts it) without
   fixing anything.
2. **No ripples** → done. Future phases inherit the change automatically.
3. **Small ripples** (a few files) → **sync**: the agent fixes the affected
   specs and code in one run.
4. **Huge ripples** (a framework swap after five shipped phases) → don't let
   the agent free-jazz across the codebase in one giant turn. Turn the sync
   into what it really is — **a migration phase on the roadmap** — and eat it
   with the two normal buttons: spec it, implement it task group by task
   group, validation gate after each.

Closed phases' documents stay frozen as history; the living code always
follows the current constitution.

## Install

**Claude Code, global** — the five skills in every project on this machine:

```sh
git clone git@github.com:dacquaviva/MySSD.git
cd MySSD && ./install.sh
```

**Claude Code, per-project** — travels with the repo, shared with teammates:

```sh
cp -r adapters/claude/skills <your-project>/.claude/skills
```

**Any other agent** — [`prompts/`](prompts/) is the canonical, agent-neutral
kit: paste the files into any tool, or wire them up as that tool's custom
commands (Cursor `.cursor/commands/`, Copilot `.github/prompts/`, Codex
`~/.codex/prompts/`, …). An adapter is just these prompts in that tool's
expected format.

## Origin

Extracted from a spec-driven development course project — an AI-agent clinic
built phase by phase with exactly these prompts.
