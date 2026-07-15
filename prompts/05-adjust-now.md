<!-- ADJUST-NOW — an immediate change to current or existing work (a new
     flag, a renaming, different behavior), at any point: between phases,
     between task groups, or mid-group. Name the change. -->

Change this now: <the change, in plain language>.

1. Implement it following the constitution's conventions
   (specs/tech-stack.md). Minimal diff — no speculative extras.
2. Run the validation gate; green before showing anything. Verify behavior
   for real where practical (run the actual command, not only the tests).
3. Report what changed and how I can check it, then wait. Commit only when
   I confirm.

In the same motion, update every document the change made stale — a
decision must never live only in the conversation:
- specs/tech-stack.md / mission.md / roadmap.md, if it embodies or alters a
  project-level decision or convention;
- the open phase's plan.md / requirements.md / validation.md, if a group is
  open — the spec must never lag the built code (closed phases stay
  untouched);
- README or other docs whose commands/behavior changed.
Commit the spec updates with a clear message.

If it turns out to be a future requirement with nothing buildable now, stop
and treat it as ADJUST-LATER instead.
