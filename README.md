# MissionSpace Agent Skill

This repository contains one installable MissionSpace skill using the Agent Skills format.

Skill path in this repo:

- `skills/missionspace`

It is designed to work in OpenAI Codex, Claude Code, and other Agent-Skills-compatible tools.

## Repository Layout

- `skills/missionspace/SKILL.md`: main instructions and metadata
- `skills/missionspace/references/backend-api/`: bundled backend API docs snapshot
- `skills/missionspace/scripts/sync_backend_api_docs.sh`: snapshot sync helper
- `skills/missionspace/agents/openai.yaml`: optional Codex-specific metadata

## Install in OpenAI Codex

```bash
$skill-installer install https://github.com/aarroisi/missionspace_skill/tree/main/skills/missionspace
```

If you fork this repo, replace the GitHub owner/repo in the URL.

## Install in Claude Code

Claude Code loads skills from `~/.claude/skills/<skill-name>/SKILL.md` (personal) or `.claude/skills/<skill-name>/SKILL.md` (project).

From this repo root:

```bash
mkdir -p ~/.claude/skills
cp -R skills/missionspace ~/.claude/skills/missionspace
```

## Install in Other Compatible Agents

Copy `skills/missionspace` into your agent's configured skills directory.

## Keep References in Sync

From this repo root:

```bash
./skills/missionspace/scripts/sync_backend_api_docs.sh
```

Default source path (when this repo is next to the `missionspace` repo):

- `../missionspace/server/docs/backend-api`

Or pass an explicit source path:

```bash
./skills/missionspace/scripts/sync_backend_api_docs.sh /absolute/path/to/missionspace/server/docs/backend-api
```

## Notes

- `skills/missionspace/references/backend-api` is a portable snapshot.
- Run sync before publishing when MissionSpace backend docs change.
