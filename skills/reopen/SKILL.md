---
name: reopen
description: Reopen a completed (✅) phase to keep improving a living research deliverable — a model, algorithm, or metric that's never truly "done". Flips the phase from done back to active and appends a new dated improvement round to its existing spec folder, instead of scattering "improve-X-v2/v3" phases across the roadmap. Use for "reopen phase X", "let's improve the <algorithm/model> again", "go back to <phase> and make it better". For a genuinely new deliverable use /spec-phase; for a one-off tweak use /adjust-now.
argument-hint: which done phase to reopen + the improvement goal
---

The phase to reopen + the improvement goal: $ARGUMENTS

(If empty, ask which completed phase and what to improve.)

Research deliverables are living — you come back and sharpen them as you
learn. Reopening keeps every round attached to the one deliverable instead
of spawning a new phase per tweak. **History is appended, never erased.**

Steps:

1. Find the completed (✅) phase's dated spec folder
   (`specs/YYYY-MM-DD-<feature>/`). **Keep its folder name** — that date is
   when the deliverable was born, not when it was last touched.
2. **roadmap.md**: drop the ✅ from the phase heading (it's active again) and
   add a dated one-liner: `reopened YYYY-MM-DD — <goal>`. Leave the rest of
   the phase's history intact.
3. **plan.md**: append `## Round N — <goal> (reopened YYYY-MM-DD)` with the
   new task group(s). Leave earlier rounds and their ✅ statuses exactly as
   they are.
4. **validation.md**: append `## Round N validation` with the new checks and
   a Status line (reopened → in progress). Keep prior rounds' passed blocks
   as the historical record.
5. **requirements.md**: append a short `## Round N` note only if the goal
   expands scope; otherwise leave it.
6. Commit the spec change. Then work the round with **/next-task** or
   **/adjust-now** — the phase is simply open again, so those apply unchanged.
7. **Re-close** when the round re-validates: Status passed, ✅ back on the
   roadmap heading.

Never rewrite or delete prior rounds — reopening only appends. If the
"improvement" is really a brand-new deliverable, use /spec-phase instead.
