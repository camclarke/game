# Postmortem — <one-line title> (<YYYY-MM-DD>)

> **Blameless.** The subject is the system, not the person. Ask *what made this possible and what prevents it next time*, never *who to blame*. Write for someone with zero memory of the incident.

Write one whenever an incident lost work or save data, broke the build for more than a day, bloated the repository, or was non-obvious enough that future work would benefit. Name files `<YYYY-MM-DD>-<slug>.md`.

- **Date of incident:** <YYYY-MM-DD>
- **Author:** <who wrote this up>
- **Severity:** HIGH | MED | LOW (see `qa/conventions.md`)
- **Status:** Resolved | Mitigated | Monitoring
- **Related:** PR #… · gotcha #… · finding F-…

## Impact

What broke, for whom and for how long. Quantify it: hours of work lost, assets lost, repository size added, builds broken. If nothing was actually lost, say so plainly and explain why it *looked* worse.

## Timeline

All times UTC, from detection through diagnosis and mitigation to resolution.

| Time (UTC) | Event |
|---|---|
| … | … |

## Root cause

The actual mechanism, one level below the symptom. Separate **fact** from **hypothesis**. If two unrelated things got tangled together, untangle them here.

## What made it possible

The latent conditions, not the trigger: a missing guardrail, a silent failure mode, a convention that invited the mistake. The prevention items come from this section.

## Resolution

What actually fixed it, and how the fix was verified (in PIE, in a packaged build, or by a check).

## Prevention / action items

Concrete, owned and checkable. Prefer mechanisms (a rule, a test, a CI check) over "be more careful". Mark each one landed or open.

- [ ] …
- [x] … (PR #…)

## Lessons

One or two durable takeaways worth carrying forward: the kind that becomes a gotcha.
