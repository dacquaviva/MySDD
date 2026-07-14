---
name: spec-phase
description: Spec the next roadmap phase — create specs/YYYY-MM-DD-<feature>/ with plan.md, requirements.md and validation.md after asking grouped questions. Run once per phase, when the previous phase closed.
---

Find the next phase without ✅ on `specs/roadmap.md`. We work directly on main, no branches.

If the previous phase is still unfinished (open task groups or an unclosed validation), say so and stop instead of speccing ahead.

Create a new directory `specs/YYYY-MM-DD-<feature-name>/` (today's date) containing:

- `plan.md` — the phase as a series of small numbered task groups; each group ends with the repo green (the project's validation gate passes) and one commit on main.
- `requirements.md` — goal, scope (in and out), decisions with rationale, context.
- `validation.md` — how we know the phase succeeded and can be marked ✅; automated checks as tests wherever possible, only genuinely manual checks stay manual. Checkbox format, plus a Status line.

Refer to `specs/mission.md` and `specs/tech-stack.md` for guidance.

Important: you MUST use the AskUserQuestion tool — grouped on these 3 files, in a single call — BEFORE writing to disk. Commit the spec.
