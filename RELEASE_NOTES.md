# Release Notes

## v0.2.0 - Cross-Agent Repository Layout

This release restructures the repository to be tool-agnostic and easier to install across coding agents.

### Changed

- Moved the canonical skill package to `skills/missionspace/`
- Updated installation docs for both Codex and Claude Code
- Updated remote install path to `.../tree/main/skills/missionspace`
- Added open-standard compatibility metadata in `SKILL.md`

### Fixed

- Corrected default docs sync source path in `skills/missionspace/scripts/sync_backend_api_docs.sh`

## v0.1.0 - Initial MissionSpace Skill

This release introduces the first installable MissionSpace skill package.

### Added

- `missionspace` skill with focused guidance for MissionSpace API and realtime operations
- Bundled backend API docs snapshot in `references/backend-api/`
- Sync helper script: `scripts/sync_backend_api_docs.sh`
- Optional metadata for UI presentation in `agents/openai.yaml`
- Local and remote install documentation in `README.md`

### Notes

- The references folder is intentionally a snapshot for portability.
- Run `./skills/missionspace/scripts/sync_backend_api_docs.sh` before publishing updates to keep docs aligned with the main MissionSpace repository.
