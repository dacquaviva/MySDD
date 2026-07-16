<!-- SPIKE — try/prototype something on the side, full context, zero
     commitment. No changes to the constitution, specs, or tracked code.
     State the question or idea to explore. -->

Spike (throwaway exploration): <the question or idea>.

Read anything for context — the constitution (specs/), the code, the data,
git log — but change NOTHING tracked. Work only in a gitignored scratch area
(default experiments/ at the project root; add it to .git/info/exclude if it
isn't already ignored, so nothing leaks — that's the only allowed touch).
Prefer importing/reusing the real code over reimplementing so the finding
transfers. Run, measure, render freely (respect the project's compute rules).
Time-box it — answer the question, don't gold-plate.

End with:
- findings: what you tried, what happened, the evidence (numbers/artifact/
  path), and the honest verdict;
- the promote-or-discard call: worth building → /adjust-now; a new
  requirement/decision → /adjust-later or /spec-phase; not worth it → say so;
- offer to record the finding (a memory or short note) so the learning
  survives even if the scratch code is thrown away.

Never edit the constitution, the specs, the README, or the shipping code. If
a decision surfaces, name it and hand off — don't make it in the spike.
