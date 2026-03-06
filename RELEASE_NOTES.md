# Release Notes

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
- Run `./scripts/sync_backend_api_docs.sh` before publishing updates to keep docs aligned with the main MissionSpace repository.
