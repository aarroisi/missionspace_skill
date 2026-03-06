#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
DEST_DIR="$SKILL_ROOT/references/backend-api"

DEFAULT_SOURCE="$SKILL_ROOT/../missionspace/server/docs/backend-api"
SOURCE_DIR="${1:-$DEFAULT_SOURCE}"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Source docs directory not found: $SOURCE_DIR" >&2
  echo "Usage: $0 [path-to-missionspace/server/docs/backend-api]" >&2
  exit 1
fi

mkdir -p "$DEST_DIR"

if command -v rsync >/dev/null 2>&1; then
  rsync -a --delete --include "*/" --include "*.md" --exclude "*" "$SOURCE_DIR/" "$DEST_DIR/"
else
  rm -rf "$DEST_DIR"
  mkdir -p "$DEST_DIR"
  cp -R "$SOURCE_DIR"/. "$DEST_DIR"/
fi

echo "Synced MissionSpace backend API docs"
echo "Source: $SOURCE_DIR"
echo "Destination: $DEST_DIR"
