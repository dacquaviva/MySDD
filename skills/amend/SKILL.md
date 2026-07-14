---
name: amend
description: Record a changed or firmed-up project-level decision in the constitution and report the blast radius. Use whenever a mission/tech-stack/roadmap decision changes.
argument-hint: the decision, in plain language
---

The user's decision: $ARGUMENTS

(If empty, ask what the decision is.)

Update the constitution — `specs/mission.md`, `specs/tech-stack.md`, and/or `specs/roadmap.md`, whichever apply — to reflect the decision, with a short rationale. Commit.

End your reply by reporting the blast radius: do any existing specs or code now contradict the amended constitution? List exactly what a /sync would touch — but do NOT fix anything yet. If nothing contradicts, say "no ripples — nothing to sync".
