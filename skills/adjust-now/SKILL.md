---
name: adjust-now
description: Immediate user-requested change to current or existing work — a new flag/switch, a renaming, a layout or behavior change ("can you change …", "use … instead of …", "I don't like …") — at any point, between phases, between task groups, or mid-group. Implement it right away AND keep the constitution and specs in lockstep. For future-facing requirements with nothing to build now, use /adjust-later instead.
argument-hint: the change, in plain language
---

The change the user wants: $ARGUMENTS

(If empty, ask what to change.)

Do it now, with normal rigor:

1. Implement the change following the constitution's conventions (`specs/tech-stack.md`). Minimal diff — no speculative extras.
2. Run the project's validation gate; green before showing anything. Verify behavior for real where practical (run the actual command, not only the tests).
3. Report what changed and exactly how the user can check it, then wait. Commit only when the user confirms (the project's commit rules apply).

In the same motion, update every document the change made stale — a decision must never live only in the conversation:

- `specs/tech-stack.md` / `mission.md` / `roadmap.md`, if the change embodies or alters a project-level decision or convention.
- The open phase's spec (dated `specs/*/`: `plan.md`, `requirements.md`, `validation.md`), if a task group is open or the phase isn't closed — the spec must never lag the built code. Closed phases stay untouched.
- README or other project docs whose commands/behavior the change altered.
- Commit the spec/constitution updates in the specs repo/folder with a clear message.

If while implementing it becomes clear this is really a future requirement (nothing buildable now), stop and treat it as /adjust-later instead.
