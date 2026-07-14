#!/usr/bin/env sh
# Install the Claude Code adapter globally: symlink each skill into
# ~/.claude/skills so every project on this machine gets the slash commands.
# (Other agents: see adapters/ and prompts/ in the README.)
set -e

SRC="$(cd "$(dirname "$0")/adapters/claude/skills" && pwd)"
DEST="$HOME/.claude/skills"
mkdir -p "$DEST"

for d in "$SRC"/*/; do
  name="$(basename "${d%/}")"
  ln -sfn "${d%/}" "$DEST/$name"
  echo "linked ~/.claude/skills/$name"
done

echo "Done. New Claude Code sessions will offer:"
echo "  /constitution  /amend <decision>  /spec-phase  /next-task  /sync <change>"
