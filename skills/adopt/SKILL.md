---
name: adopt
description: Adopt spec-driven development in an existing codebase — reverse-engineer the constitution (specs/mission.md, tech-stack.md, roadmap.md) from code, docs and backlog, interviewing on the gaps. Run once, instead of /constitution, when the project already exists.
---

The project already exists — the constitution must describe reality before it prescribes anything.

First read the evidence: README and docs, dependency manifests, entry points, tests, CI config, TODO/backlog/issues, and `git log --oneline`. Do not ask about anything the code can answer.

Then create the constitution in a specs directory:

- `specs/mission.md` — what the product observably does and for whom; keep inferred intent clearly separate from fact.
- `specs/tech-stack.md` — decisions already embodied in the code, each with a one-line rationale; flag inherited-but-questionable choices explicitly instead of papering over them.
- `specs/roadmap.md` — what already exists as ✅ phases (a short, honest history — never fiction), then future work in very small phases built from the TODOs/backlog, each with a concrete "done when".

Important: you MUST use the AskUserQuestion tool — one question per file, grouped in a single call, focused on the gaps the code cannot answer (intent, audience, deferred decisions, priority order) — BEFORE writing anything to disk. Reflect the answers in the files. Commit the result.

From here the normal loop applies: /spec-phase → /next-task ×N.
