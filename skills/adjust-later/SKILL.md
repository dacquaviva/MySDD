---
name: adjust-later
description: Record a new or changed project-level decision — something for the project's future (a new requirement, feature, constraint, or re-decision) — in the constitution, and propagate it into the roadmap and any open phase specs. Plans only, no code edits; implementation happens when the affected groups get built. For "change this now" requests on existing work, use /adjust-now instead.
argument-hint: the decision, in plain language
---

The user's decision: $ARGUMENTS

(If empty, ask what the decision is.)

1. Update the constitution — `specs/mission.md`, `specs/tech-stack.md`, and/or `specs/roadmap.md`, whichever apply — to reflect the decision, with a short rationale.

2. Propagate into the plans: re-read the roadmap and any phase spec that is still open (a dated `specs/*/` directory whose `plan.md` has open task groups or whose validation isn't closed). Update whatever the decision influences — add, adjust, or drop roadmap phases and task groups, fix "done when" lines, requirements, and validation checks. Closed phases stay untouched (they are history). Do NOT edit code — the code catches up when those groups are implemented.

3. Commit everything in the specs repo/folder, message starting `amend:`.

End your reply by listing what was updated where (constitution sections, roadmap phases, task groups), and what will pick the decision up naturally at implementation time. If nothing beyond the constitution needed changes, say so.
