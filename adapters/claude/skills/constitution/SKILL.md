---
name: constitution
description: Create the project constitution (specs/mission.md, tech-stack.md, roadmap.md) after asking grouped questions. Run once per project, right after orienting on the brief.
---

Create a "constitution" in a specs directory:

- `specs/mission.md` — what we're building, for whom, tone, what success looks like.
- `specs/tech-stack.md` — technology decisions with one-line rationales; note deferred decisions explicitly.
- `specs/roadmap.md` — high-level implementation order, in very small phases of work, each with a concrete "done when". Phases get ✅ appended to their heading when complete.

Ground everything in the project's brief (README or equivalent) and stakeholder input.

Important: you MUST use the AskUserQuestion tool — one question per file, grouped in a single call — BEFORE writing anything to disk. Reflect the answers in the files. Commit the result.
