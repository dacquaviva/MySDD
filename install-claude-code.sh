#!/usr/bin/env sh
# Symlink each skill into ~/.claude/skills so every project on this machine
# gets: /what-do-i-do /constitution /adopt /amend /spec-phase /next-task /sync
set -e

SRC="$(cd "$(dirname "$0")/skills" && pwd)"
DEST="$HOME/.claude/skills"
mkdir -p "$DEST"

for d in "$SRC"/*/; do
  name="$(basename "${d%/}")"
  ln -sfn "${d%/}" "$DEST/$name"
  echo "linked ~/.claude/skills/$name"
done

echo "Done."
