<!--
Checklist for every PR. Delete rows that don't apply, but read every one.
Add a row whenever something bites.
-->

## What & why

<!-- One or two sentences: what changes and why. Link the plan (docs/plans/…), finding ID or issue. -->

## Out of scope, on purpose

<!-- What this PR deliberately does NOT touch, so nobody wonders. -->

## Checklist

- [ ] **Compiles** in Development Editor, with no new warnings in the files touched.
- [ ] **Automation tests pass locally.** New pure-logic C++ has a test.
- [ ] **Played it in the editor (PIE)** and saw the change work. Under Verification, say what you did and what you saw.
- [ ] **Binary assets are in Git LFS.** CI checks this; `git lfs ls-files` lists every new `.uasset` and `.umap`.
- [ ] **No generated folders** committed: `Binaries/`, `Intermediate/`, `Saved/`, `DerivedDataCache/`.
- [ ] **Third-party assets:** the license allows them in a public repo, and the source is credited.
- [ ] **Performance** checked with `stat unit` on the affected scene, if this touches Tick, rendering or spawning.
- [ ] **Engine version unchanged**, or this PR is the engine-upgrade PR and does nothing else.
- [ ] **Docs updated** if this adds a rule (`docs/gotchas/`), closes a finding (`qa/OPEN-FINDINGS.md`) or changes a plan.

## Verification

<!-- Say which claim you have: compiles / tests pass / played in PIE / verified in a packaged build. -->

## Rollback

<!-- Revert commit, config switch, or steps to restore the previous assets. -->
