<!--
Checklist for every PR. Delete rows that don't apply, but read every one.
Add a row whenever something bites.
-->

## What & why

<!-- One or two sentences: what changes and why. Link the plan (docs/plans/…), finding ID or issue. -->

## Out of scope, on purpose

<!-- What this PR deliberately does NOT touch, so nobody wonders. -->

## Checklist

- [ ] **Compiles:** the Unity Console shows no errors, and no new warnings from the files touched.
- [ ] **Tests pass** in the Test Runner (Edit Mode and Play Mode). New pure-logic C# has an Edit Mode test.
- [ ] **Played it in Play Mode** and saw the change work. Under Verification, say what you did and what you saw.
- [ ] **`.meta` files travel with their assets.** Every new or moved asset has its `.meta`, and no orphan `.meta` is left for a deleted one. Unity links assets through the IDs inside `.meta` files, so a missing one breaks references.
- [ ] **Binary assets are in Git LFS.** CI checks this; `git lfs ls-files` lists every new texture, model and audio file.
- [ ] **No generated folders** committed: `Library/`, `Temp/`, `Obj/`, `Logs/`, `UserSettings/`, `Build/`.
- [ ] **Third-party assets:** the license allows them in a public repo, and the source is credited.
- [ ] **Performance** checked in the Profiler on the affected scene, if this touches `Update` loops, rendering, physics or spawning.
- [ ] **Packages:** any change to `Packages/manifest.json` is intended and explained above.
- [ ] **Unity version unchanged** (`ProjectSettings/ProjectVersion.txt`), or this PR is the upgrade PR and does nothing else.
- [ ] **Docs updated** if this adds a rule (`docs/gotchas/`), closes a finding (`qa/OPEN-FINDINGS.md`) or changes a plan.

## Verification

<!-- Say which claim you have: compiles / tests pass / played in Play Mode / verified in a build. -->

## Rollback

<!-- Revert commit, or steps to restore the previous assets or settings. -->
