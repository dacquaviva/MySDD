<!-- ADJUST-LATER — a new or changed decision for the project's FUTURE
     (requirement, feature, constraint, re-decision). Plans only, no code.
     Replace the first line with your decision, in plain language. -->

<State the decision in plain language.>

1. Update the constitution (specs/mission.md, specs/tech-stack.md,
   specs/roadmap.md — whichever apply) to reflect it, with a short rationale.

2. Propagate into the plans: re-read the roadmap and any phase spec still
   open (a dated specs/*/ whose plan.md has open task groups or an unclosed
   validation). Update whatever the decision influences — add, adjust, or
   drop phases and task groups, fix "done when" lines, requirements and
   validation checks. Closed phases stay untouched (history). Do NOT edit
   code — it catches up when those groups are implemented. If the blast
   radius is huge, add a migration phase to the roadmap instead.

3. Commit the spec changes, message starting `amend:`.

End by listing what was updated where, and what picks the decision up
naturally at implementation time.
