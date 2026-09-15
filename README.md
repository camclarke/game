# Isometric game (working title)

An isometric game built in Unity with C#.

**Status:** pre-production. Repository conventions are in place; the Unity project has not been created yet.

## Requirements

- **Unity 6.3 LTS**, installed through [Unity Hub](https://unity.com/download). The exact version is pinned in `ProjectSettings/ProjectVersion.txt` once the project exists.
- **A C# editor.** This project uses Visual Studio 2026 with the "Game development with Unity" workload.
- **[Git LFS](https://git-lfs.com).** Binary assets (textures, models, audio, video) are stored in LFS. Run `git lfs install` once before cloning.

## Repository layout

The Unity project will sit at the repository root (`Assets/`, `Packages/`, `ProjectSettings/`).

| Path | What it holds |
|---|---|
| `docs/plans/` | Design and implementation plans, one file per topic |
| `docs/gotchas/` | Numbered rules learned the hard way |
| `qa/` | Open findings, QA conventions and postmortems |
| `tools/ci/` | Scripts CI runs; each one also runs locally |

## Checks

CI runs [`tools/ci/check-lfs-pointers.sh`](tools/ci/check-lfs-pointers.sh) on every pull request. It fails if a binary asset was committed without Git LFS.

Unity tests run locally in the Test Runner for now; running them in CI needs a Unity license on the build machine.
