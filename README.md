# MySSD — a tiny spec-driven development kit for AI coding agents

Five prompts that run a whole project. All project state lives in your repo's
`specs/` directory — the prompts never carry project knowledge, so the same
kit works on any project, with any coding agent.

## Layout

```
prompts/    the kit itself — plain markdown, agent-neutral, paste anywhere
adapters/   optional per-agent sugar (native slash commands)
  claude/   Claude Code skills:  /constitution /amend /spec-phase /next-task /sync
install.sh  global install of the Claude adapter (symlinks into ~/.claude/skills)
```

`prompts/` is the product. Adapters exist only because each agent has its own
convention for custom commands; an agent without an adapter still works —
paste the prompt.

## The loop

```
0 ORIENT ─► 1 CONSTITUTION ─► ┌► 3 SPEC PHASE ─► 4 NEXT TASK ×N ─┐
                              └────────── next phase ◄───────────┘
        2 AMEND / 5 SYNC ── whenever a decision changes

stop when: specs/roadmap.md shows every phase ✅
```

| Prompt | When | What it does |
| --- | --- | --- |
| `prompts/00-orient.md` | once, first message | context only — point at the brief |
| `prompts/01-constitution.md` | once per project | `specs/`: mission + tech-stack + roadmap, questions first |
| `prompts/02-amend.md` | a decision changes | update the constitution, report the blast radius |
| `prompts/03-spec-phase.md` | once per phase | dated spec dir: plan / requirements / validation, questions first |
| `prompts/04-next-task.md` | once per task group | implement the next group, keep green, tick statuses |
| `prompts/05-sync.md` | after an amend with ripples | bring existing specs + code in line |

## Concepts in five lines

- **Constitution** = the law: why (mission), how (tech stack), in what order
  (roadmap, in very small phases).
- **Phase** = a slice of the product. Gets a dated spec folder and a
  validation gate; ✅ on the roadmap when all green.
- **Task group** = a slice of a phase. One sitting of work, one green commit.
- **Amend** = change the law. **Sync** = fix whatever the new law made wrong.
  Closed phases' documents stay frozen as history.
- Always commit `specs/`: if a human or agent *decided* it, commit it; if a
  tool can *regenerate* it, gitignore it.

## Install

**Claude Code, global** — available in every project on this machine:

```sh
git clone git@github.com:dacquaviva/MySSD.git
cd MySSD && ./install.sh
```

**Claude Code, per-project** — travels with the repo, shared with teammates:

```sh
cp -r adapters/claude/skills <your-project>/.claude/skills
```

**Any other agent** — use `prompts/` directly: paste into the chat, or wire
the files up as that tool's custom commands (Cursor `.cursor/commands/`,
Copilot `.github/prompts/`, Codex `~/.codex/prompts/`, …). Contributions of
new adapters welcome — an adapter is just the same prompts in that tool's
expected format.

## Origin

Extracted from a spec-driven development course project — an AI-agent clinic
built phase by phase with exactly these prompts.
