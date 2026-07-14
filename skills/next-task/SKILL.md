---
name: next-task
description: Implement the next open task group from the active phase's plan.md, keep the repo green, update statuses. The workhorse — run once per task group until the phase closes.
---

If there are uncommitted changes, stop and ask first.

Find the active feature spec under `specs/` (the dated directory whose `plan.md` still has open task groups). Take the NEXT open task group and implement it — only that one.

Use that directory's `requirements.md` and `validation.md` for guidance, and the constitution (`specs/mission.md`, `specs/tech-stack.md`) for conventions.

The group is done when the repo is green: run the project's validation gate (build + tests). Verify behavior for real where practical (run the app, hit the routes), not just via unit tests. If the gate fails, find the root cause before changing anything — no retry-until-green.

Do NOT commit yet. Report what was implemented and exactly how the user can check it (commands to run, URLs to open, what they should see), then wait. Only when the user confirms:

- mark the group ✅ done in `plan.md`;
- tick any `validation.md` boxes now genuinely satisfied — never tick a box that wasn't actually checked;
- commit on main with the message format the plan prescribes.

If this was the last group: run the full validation checklist, set the validation Status line to passed, mark the phase ✅ in `specs/roadmap.md`, and say explicitly that the phase closed. Then debrief in a bullet or two: anything in this phase's specs that turned out ambiguous, missing, or wrong while implementing — spec feedback for the user to fold back in, not fixes.

Always end by saying what's next.
