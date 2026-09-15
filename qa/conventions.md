# QA conventions

How QA is run and recorded in this repo.
- Live defect log: [`OPEN-FINDINGS.md`](OPEN-FINDINGS.md)
- Session logs: `logs/<YYYY-MM-DD>-<topic>.md`
- Incidents: [`postmortems/`](postmortems/)

## Severity vs priority: record both

They answer different questions and often diverge. A typo on the title screen is *low severity, high priority*; a crash in a debug-only menu is *high severity, low priority*.

| Severity | Meaning |
|---|---|
| `HIGH` | Crash, save data lost or corrupted, softlock (the player can't progress), broken build |
| `MED` | Gameplay bug or noticeable frame drop on a common path |
| `LOW` | Cosmetic: visual glitch, typo, wrong sound |
| `INFO` | Note; no action yet |

| Priority | Meaning |
|---|---|
| `P0` | Drop everything |
| `P1` | Before the next milestone |
| `P2` | Soon |
| `P3` | Backlog |

## Bug report

The non-negotiable core is **Steps → Expected → Actual.** Always record the build type, because Play In Editor (PIE), a Development build and a Shipping build behave differently. Back every claim with evidence.

```markdown
### F-<letter><n> · <one-line title>
- **Severity:** HIGH|MED|LOW|INFO   **Priority:** P0|P1|P2|P3   **Status:** Open|Fixed (PR #)|Verified|Won't fix
- **Area:** <system / class / asset>
- **Build:** <PIE | Standalone | packaged Development | packaged Shipping> · engine <5.x> · commit <…>
- **Preconditions:** <level, save file, scalability settings, resolution>
- **Steps to reproduce:**
  1. …
- **Expected:** …
- **Actual:** …
- **Repro rate:** <n of m tries>
- **Evidence:** <log excerpt from Saved/Logs · crash report · screenshot or video path>
- **Root cause:** <if known — label hypotheses as hypotheses>
- **Fix + regression test:** <PR # · test name>
- **Verified:** <date, how — in PIE or a packaged build>
```

## Session log

```markdown
# QA session — <topic> (<YYYY-MM-DD>)

- **Goal:** <what this session verifies>
- **Build:** commit <…> · branch <…> · <PIE | packaged Development | Shipping> · engine <5.x>
- **Hardware and settings:** <GPU · scalability · resolution · frame cap>
- **Method:** <how each case was exercised>

## Results

| # | Case | Expected | Actual | Pass? |
|---|---|---|---|---|

## Findings
<each new defect uses the bug template and is carried into OPEN-FINDINGS.md>

## Teardown
<test save files and config overrides removed; the project is back to a clean baseline>
```

## Levels of evidence

Say which level a result reached. These are different claims:
- compiles;
- automation tests pass;
- break-probed (a rule was broken on purpose and a named test failed);
- played in the editor (PIE);
- verified in a packaged build.

## Timing-dependent bugs

- Frame rate, physics and async loading make some bugs intermittent. Report a **repro rate over tries** (for example 3 of 10), never a single pass or fail.
- Test at a low frame rate too (`t.MaxFPS 20`). Logic that assumes a steady frame time breaks there.
- A bug that only shows in a packaged build is real. Don't close it because PIE works.

## Secrets and local files

- **Never commit credentials** (store keys, signing certificates, account tokens). Git history is permanent.
- Sensitive or large scratch goes in `qa/_local/`, which is gitignored.
