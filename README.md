# Isometric game (working title)

An isometric game built in Unreal Engine 5. Gameplay systems are written in C++; tuning, visuals and level scripting are done in Blueprints.

**Status:** pre-production. Repository conventions are in place; the Unreal project has not been created yet.

## Requirements

- **Unreal Engine 5.** The exact version is pinned in the `.uproject` file once the project exists.
- **Visual Studio** with the "Game development with C++" workload, at the version Epic lists for that engine release.
- **[Git LFS](https://git-lfs.com).** Binary assets (`.uasset`, `.umap`, textures, audio, meshes) are stored in LFS. Run `git lfs install` once before cloning.

## Repository layout

| Path | What it holds |
|---|---|
| `docs/plans/` | Design and implementation plans, one file per topic |
| `docs/gotchas/` | Numbered rules learned the hard way |
| `qa/` | Open findings, QA conventions and postmortems |
| `tools/ci/` | Scripts CI runs; each one also runs locally |

## Checks

CI runs [`tools/ci/check-lfs-pointers.sh`](tools/ci/check-lfs-pointers.sh) on every pull request. It fails if a binary asset was committed without Git LFS.

Compiling and automation tests run locally for now, because GitHub's hosted runners don't have Unreal Engine installed.
