---
name: missionspace
description: Use this skill when tasks involve MissionSpace APIs, auth/scopes, data model, or realtime channels. Do not use for generic non-MissionSpace coding tasks.
compatibility: Agent Skills open standard; tested with OpenAI Codex and Claude Code.
metadata:
  version: "0.2.0"
---

# MissionSpace Agent Skill

Use this skill to operate against MissionSpace as an API-first collaboration system.

## Purpose

Provide reliable operating guidance for any agent that needs to:

- read or mutate MissionSpace data through HTTP APIs
- use API keys and role scopes safely
- subscribe to or reason about realtime channel behavior
- avoid common contract mistakes (casing, wrappers, item type aliases)

## Canonical Docs

This skill bundles a snapshot of backend API docs under:

- `references/backend-api/index.md`
- `references/backend-api/http-conventions.md`
- `references/backend-api/resource-schemas.md`
- `references/backend-api/*.md`

If these references are stale, sync from the MissionSpace repo using:

```bash
./scripts/sync_backend_api_docs.sh
```

Default source path assumed by the script in this repository layout:

- sibling repo: `../missionspace/server/docs/backend-api`

If the skill is installed elsewhere (for example `~/.claude/skills/missionspace`), pass an explicit source path:

```bash
./scripts/sync_backend_api_docs.sh /absolute/path/to/missionspace/server/docs/backend-api
```

## Core Model and Terms

- MissionSpace is workspace-scoped; nearly all operations are constrained by `workspace_id`.
- Main domains:
  - planning: projects, boards (DB list), statuses, tasks
  - docs: doc folders, docs
  - chat: channels, direct messages, messages
  - engagement: stars, subscriptions, notifications, read positions
  - files: assets, workspace storage quota
- Important aliasing:
  - API often says `board`
  - some endpoints and internals still use `list`
  - map carefully per endpoint contract

## Authentication and Authorization

- Supported auth modes:
  - session cookie (`_missionspace_key`)
  - API key (`msk_...`) via `X-API-Key` or `Authorization: Bearer msk_...`
- API keys are user-scoped; workspace context is derived from the key's attached user.
- Effective scopes for API key calls are intersection-based:

```text
effective_scopes = api_key_scopes INTERSECT role_scopes(user.role)
```

- Role model: `owner`, `member`, `guest`.
- High-level guardrails:
  - owner-only: workspace and project membership/admin operations
  - non-owners: mostly own-item mutations plus authorized visibility
  - guest: only one project-or-item membership total

## HTTP API Conventions

- Base API namespace: `/api`.
- JSON everywhere.
- Cursor pagination uses `limit`, `after`, `before`.
- Common list response shape:

```json
{
  "data": [],
  "metadata": {
    "after": null,
    "before": null,
    "limit": 50
  }
}
```

- Error payloads are not perfectly uniform. Expect both:
  - `{"errors": {...}}`
  - `{"error": "..."}`

## Realtime Conventions

- Primary transport: `WS /socket/websocket`.
- Connect params require signed token.
- Topic families:
  - `list:*`
  - `task:*`
  - `doc:*`
  - `channel:*`
  - `dm:*`
  - `notifications:*`
- Topic join is authorization-sensitive (workspace checks, DM participant checks, self-only notifications topic).

## Agent Workflow (Recommended)

1. Confirm auth mode and identity context.
2. Resolve role + effective scopes.
3. Resolve workspace-scoped target resource.
4. Validate endpoint-specific enum values and request key casing.
5. Execute request with expected wrapper shape.
6. Parse non-uniform error payloads robustly.
7. For writes, verify postconditions with a read-back call.

## Critical Do / Do Not Rules

1. Do always assume workspace isolation; do not attempt cross-workspace access.
2. Do enforce role/scope checks before writes; do not assume API key scopes alone grant access.
3. Do use endpoint-specific key casing and body shape; do not globally normalize payloads.
4. Do handle `board` vs `list` aliases carefully; do not reuse enums blindly.
5. Do use cursor pagination loops; do not assume page/offset.
6. Do treat 403/404 differences as auth-sensitive behavior.
7. Do keep guest membership limit in mind when assigning members.
8. Do confirm asset uploads (`request-upload` then `confirm`); do not treat presign as completed upload.
9. Do enforce message update/delete ownership rules.
10. Do join websocket topics only after auth context is valid.
11. Do parse mixed error envelope formats.
12. Do preserve backend contract quirks unless explicitly changed in source docs.

## Resource Quick Map

- health/auth/api keys: `references/backend-api/health-and-auth.md`
- workspace/project/item memberships: `references/backend-api/workspace-and-membership.md`
- projects/boards/statuses/tasks: `references/backend-api/projects-boards-tasks.md`
- doc folders/docs: `references/backend-api/docs-and-doc-folders.md`
- channels/dms/messages/read positions: `references/backend-api/chat-and-messaging.md`
- search/stars/subscriptions/notifications/push: `references/backend-api/search-stars-subscriptions-notifications-push.md`
- assets/storage: `references/backend-api/assets-and-storage.md`
- realtime websockets: `references/backend-api/realtime-websocket.md`
- framework/dev-only endpoints: `references/backend-api/dev-and-framework-endpoints.md`

When uncertain, consult `references/backend-api/index.md` and then the specific domain file.
