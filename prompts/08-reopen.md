<!-- REOPEN — bring a completed (✅) research phase back to active to keep
     improving it (model/algorithm/metric). Appends a new round to the same
     spec folder; history is preserved. Name the phase + the improvement goal. -->

Reopen <phase> to improve it: <the improvement goal>.

Research deliverables are living — reopening keeps every round attached to
the one deliverable instead of scattering "improve-X-v2/v3" phases. History
is appended, never erased.

- Keep the phase's existing dated spec folder (its date = when the deliverable
  was born, not last touched).
- roadmap.md: drop the ✅ from the phase heading and add a dated one-liner
  "reopened YYYY-MM-DD — <goal>".
- plan.md: append "## Round N — <goal> (reopened YYYY-MM-DD)" with the new
  task group(s); leave earlier rounds and their ✅ statuses as they are.
- validation.md: append "## Round N validation" with new checks + a Status
  line; keep prior rounds' passed blocks as history.
- requirements.md: append a short "## Round N" note only if scope expands.
- Commit the spec change, then work the round with /next-task or /adjust-now.
  Re-close (Status passed, ✅ back) when it re-validates.

Never rewrite/delete prior rounds. If it's really a new deliverable, use
/spec-phase instead.
