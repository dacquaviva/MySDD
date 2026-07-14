<!-- NEXT TASK — the workhorse. Once per task group, until the phase closes. -->

If the working tree is dirty, stop and ask first.
Take the next task group from the active feature's plan.md under specs/ and
implement it — only that one.
Use requirements.md and validation.md for guidance.
Done means the project's green command passes; if it goes red, find the root
cause before changing anything — no retry-until-green.
Once done, update the status in both the plan and validation documents.
End by saying what's next, and say explicitly if this closed the phase.
If it did, also say what in the specs was ambiguous or missing during the work.
