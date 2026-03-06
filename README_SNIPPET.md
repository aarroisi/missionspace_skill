## MissionSpace Skill (Open Agent Skills Standard)

MissionSpace is a cross-agent skill package for safely using MissionSpace APIs and realtime channels.

### Codex install

```bash
$skill-installer install https://github.com/<owner>/<repo>/tree/main/skills/missionspace
```

### Claude Code install

```bash
mkdir -p ~/.claude/skills
cp -R skills/missionspace ~/.claude/skills/missionspace
```

### Includes

- API/auth/scope/workspace safety rules
- Resource and endpoint contract guidance
- Realtime topic usage patterns
- Bundled API docs snapshot in `skills/missionspace/references/backend-api/`
- Sync helper: `skills/missionspace/scripts/sync_backend_api_docs.sh`

### Refresh snapshot

```bash
./skills/missionspace/scripts/sync_backend_api_docs.sh
```
