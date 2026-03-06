# MissionSpace Agent Skill (Cross-Agent)

This repository packages MissionSpace as an Agent Skills open-standard skill so it can be used by multiple coding agents.

Canonical skill directory:

- `skills/missionspace`

The skill has been structured and documented for broad compatibility (including OpenAI Codex and Claude Code).

## Repository Layout

- `skills/missionspace/SKILL.md`: main skill instructions + metadata
- `skills/missionspace/references/backend-api/`: bundled backend API docs snapshot
- `skills/missionspace/scripts/sync_backend_api_docs.sh`: snapshot sync helper
- `skills/missionspace/agents/openai.yaml`: optional Codex-specific UI metadata

## Install in OpenAI Codex

Install directly from this repository path:

```bash
$skill-installer install https://github.com/<owner>/<repo>/tree/main/skills/missionspace
```

## Install in Claude Code

Claude Code reads skills from `~/.claude/skills/<skill-name>/SKILL.md` (personal) or `.claude/skills/<skill-name>/SKILL.md` (project).

Example install from this repo clone:

```bash
mkdir -p ~/.claude/skills
cp -R skills/missionspace ~/.claude/skills/missionspace
```

## Install in Other Agent-Skills-Compatible Tools

Copy the whole `skills/missionspace` directory into whatever skill path your tool scans.

Requirements for portability are already met:

- skill folder with `SKILL.md`
- valid frontmatter and open-standard structure
- optional resources under `references/`, `scripts/`, and `agents/`

## Keep References in Sync

Run from repo root:

```bash
./skills/missionspace/scripts/sync_backend_api_docs.sh
```

Default sync source path:

- sibling repo: `../missionspace/server/docs/backend-api`

Or provide a custom source path:

```bash
./skills/missionspace/scripts/sync_backend_api_docs.sh /absolute/path/to/missionspace/server/docs/backend-api
```

## Notes

- `references/backend-api` is a portability snapshot.
- Sync before publishing updates when MissionSpace backend contracts change.
