---
name: what-do-i-do
description: Report where the project stands and the single next command to run — read-only. Use as the first message of any fresh session, or whenever unsure what's next.
---

Read-only: report and point, change nothing.

If there is no `specs/` directory: this project hasn't adopted the loop yet. Ask for a one-line brief and whether the codebase is new or existing, then point to /constitution (new) or /adopt (existing).

Otherwise read `specs/roadmap.md`, the active phase's `plan.md` and `validation.md`, and `git log --oneline -5`, then report in a few lines:

- Phase: the active phase, or "between phases" if the last one closed.
- Task groups: which are ✅, which is the next open one.
- Gate: run the project's green command and report pass/fail — the one allowed execution.
- Anything odd: dirty working tree, validation boxes ticked but gate red, roadmap and plan out of sync.

End with exactly one recommendation: the single command to run next (/next-task, /spec-phase, /adjust-later, ...).
