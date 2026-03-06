## MissionSpace Skill for Codex

MissionSpace is an installable Agent Skill that gives Codex reliable instructions for working with MissionSpace APIs and realtime channels.

### Install

```bash
$skill-installer install https://github.com/<owner>/<repo>/tree/main/missionspace_skill
```

### What it includes

- Core operating guide for MissionSpace auth, roles/scopes, and workspace-safe automation
- API contract guardrails (pagination, naming quirks, resource taxonomy)
- Realtime websocket topic guidance
- Bundled backend API docs snapshot under `references/backend-api/`
- Sync script to refresh docs from the source MissionSpace repo

### Keep docs fresh

```bash
cd missionspace_skill
./scripts/sync_backend_api_docs.sh
```

If your MissionSpace repo is in a different location:

```bash
./scripts/sync_backend_api_docs.sh /absolute/path/to/missionspace/server/docs/backend-api
```
