# MissionSpace Skill

Installable Codex skill for MissionSpace API and realtime operations.

## Contents

- `SKILL.md`: instructions and operating rules for agents
- `references/backend-api/`: bundled snapshot copied from `missionspace/server/docs/backend-api`
- `scripts/sync_backend_api_docs.sh`: sync helper to refresh the snapshot from the source repo
- `agents/openai.yaml`: optional metadata for skill presentation

## Install (Remote)

After you push this folder to a public repository, install via:

```bash
$skill-installer install https://github.com/<owner>/<repo>/tree/main/missionspace_skill
```

If your default branch is not `main`, replace it accordingly.

## Install (Local)

You can symlink or copy this folder into any scanned skills location (for example `~/.agents/skills`).

## Keep References in Sync

Run from this folder:

```bash
./scripts/sync_backend_api_docs.sh
```

By default, it syncs from this sibling path:

- `../missionspace/server/docs/backend-api`

If your MissionSpace repo is elsewhere, pass an explicit source path:

```bash
./scripts/sync_backend_api_docs.sh /absolute/path/to/missionspace/server/docs/backend-api
```

## Notes

- The bundled docs are a snapshot for portability.
- Always sync before publishing if MissionSpace backend docs changed.
