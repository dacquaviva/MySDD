---
name: sync
description: Bring existing specs and code in line with an amended constitution. Run after /amend reports ripples.
argument-hint: the change to propagate
---

The change to propagate: $ARGUMENTS

(If empty, use the most recent constitution amendment.)

Update existing specs and code to reflect it. In line with the amended constitution bring:

- the code and the tests — the living product must obey the current constitution;
- the active phase's `plan.md` / `requirements.md` / `validation.md` — they still direct work;
- roadmap wording for phases not yet started.

Leave closed phases' documents as historical records — a one-line footnote at most; never rewrite them to pretend a rule existed earlier than it did.

If the blast radius is large (a framework swap, a storage migration), do not attempt one big sync: propose a migration phase on the roadmap instead and stop for confirmation.

Otherwise: run the project's validation gate, then commit.
