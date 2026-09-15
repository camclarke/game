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

The non-negotiable core is **Steps → Expected → Actual.** Always record where it ran, because Play Mode in the Editor, a Development Build and a release build behave differently. Back every claim with evidence.

```markdown
### F-<letter><n> · <one-line title>
- **Severity:** HIGH|MED|LOW|INFO   **Priority:** P0|P1|P2|P3   **Status:** Open|Fixed (PR #)|Verified|Won't fix
- **Area:** <system / script / scene / prefab>
- **Build:** <Editor Play Mode | Development Build | release build> · Unity <6000.3.x> · commit <…>
- **Preconditions:** <scene, save file, quality level, resolution, Enter Play Mode settings>
- **Steps to reproduce:**
  1. …
- **Expected:** …
- **Actual:** …
- **Repro rate:** <n of m tries>
- **Evidence:** <excerpt from Editor.log or Player.log · screenshot or video path>
- **Root cause:** <if known — label hypotheses as hypotheses>
- **Fix + regression test:** <PR # · test name>
- **Verified:** <date, how — in Play Mode or in a build>
```

## Where the logs are (Windows)

| Log | Path |
|---|---|
| Editor | `%LOCALAPPDATA%\Unity\Editor\Editor.log` |
| Player (a built game) | `%USERPROFILE%\AppData\LocalLow\<CompanyName>\<ProductName>\Player.log` |

Source: [Unity 6.3 manual, Log files](https://docs.unity3d.com/6000.3/Documentation/Manual/log-files.html).

## Session log

```markdown
# QA session — <topic> (<YYYY-MM-DD>)

- **Goal:** <what this session verifies>
- **Build:** commit <…> · branch <…> · <Editor Play Mode | Development Build | release build> · Unity <6000.3.x>
- **Hardware and settings:** <GPU · quality level · resolution · frame cap>
- **Method:** <how each case was exercised>

## Results

| # | Case | Expected | Actual | Pass? |
|---|---|---|---|---|

## Findings
<each new defect uses the bug template and is carried into OPEN-FINDINGS.md>

## Teardown
<test save files and settings overrides removed; the project is back to a clean baseline>
```

## Levels of evidence

Say which level a result reached. These are different claims:
- compiles (the Console shows no errors);
- tests pass (Edit Mode and Play Mode);
- break-probed (a rule was broken on purpose and a named test failed);
- played in Play Mode;
- verified in a build.

## Timing-dependent bugs

- Frame rate, physics and async loading make some bugs intermittent. Report a **repro rate over tries** (for example 3 of 10), never a single pass or fail.
- Test at a low frame rate too: set `QualitySettings.vSyncCount = 0` and `Application.targetFrameRate = 20`. Code that assumes a steady frame time breaks there.
- A bug that only shows in a build is real. Don't close it because Play Mode works.

## Secrets and local files

- **Never commit credentials** (store keys, signing certificates, account tokens). Git history is permanent.
- Sensitive or large scratch goes in `qa/_local/`, which is gitignored.
