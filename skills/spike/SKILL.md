---
name: spike
description: Try or prototype something on the side with full project context but ZERO commitment — no changes to the constitution, specs, or tracked code. A throwaway exploration to answer a question or de-risk an idea, ending with findings + a promote-or-discard call. Use for "let me try X", "test whether Y works", "prototype Z on the side", "spike this", "does W even work". To then make it real use /adjust-now (code) or /adjust-later (plans).
argument-hint: what you want to try / the question to answer
---

The question or idea to explore: $ARGUMENTS

(If empty, ask what to try.)

This is a **spike**: a throwaway exploration with full context and zero
commitment. Read anything; change nothing tracked.

Rules:

1. **Read freely for context** — the constitution (`specs/`), the code, the
   data, `git log`. Understand what exists before building on it; prefer
   importing/reusing the real code over reimplementing, so a finding transfers.
2. **Write only to a gitignored scratch area** — default `experiments/` at the
   project root. Make sure it is ignored *without touching a tracked file*:
   add it to `.git/info/exclude` (local, not committed) if it isn't already
   ignored. Never modify tracked source, `specs/`, mission/tech-stack/roadmap,
   README, or tests. Never commit, never push.
3. **Run, measure, render, install throwaway deps freely** — trying things is
   the point. Respect the project's compute rules (e.g. where heavy runs go).
4. **Time-box it** — answer the question, don't gold-plate a throwaway.

End the spike with:

- **Findings** — what you tried, what happened, the evidence (numbers, a
  rendered artifact, a file path), and the honest verdict.
- **The promote-or-discard call:**
  - worth building → hand off to **/adjust-now** (into code) — don't implement it here.
  - a new requirement/decision → **/adjust-later** or **/spec-phase**.
  - not worth it → say so; the scratch can stay for reference or be deleted.
- **Offer to record the finding** (a memory or a short note) so the learning
  survives even if the scratch code is binned.

If the exploration surfaces a decision worth making, *name it and hand off* —
a spike never edits the constitution, the specs, or the shipping code itself.
