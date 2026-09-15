# Open findings

**Single source of truth for open defects.**
- Session logs in `qa/logs/` record what happened that day. This file records what is still open across all of them.
- Update it at the end of every QA session: add new rows, and close rows with the fixing PR number.
- **Keep it a table.** Session narratives belong in the logs; a tracker that stacks narratives grows until nobody reads it.

Conventions and templates: [`conventions.md`](conventions.md). Never commit credentials here.

**IDs:** `F-<letter><n>`, one letter per campaign (F-A1, F-A2 … F-B1). IDs are never reused.

## Open

| ID | Sev · Pri | Area | Finding (Steps → Expected → Actual, short) | Evidence / log | Status |
|---|---|---|---|---|---|

## Closed

| ID | Closed on | Fix (PR #) | Verified how |
|---|---|---|---|
