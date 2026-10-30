#!/usr/bin/env bash
# Installs the WBS plugin for the current user and adds the short /wbs command.
# Usage: ./install.sh <github-owner>/<repo>   (default: the source this script was cloned from)
set -euo pipefail
SRC="${1:-$(cd "$(dirname "$0")" && pwd)}"
command -v claude >/dev/null || { echo "Claude Code is not installed or not on PATH." >&2; exit 1; }
claude plugin marketplace add "$SRC"
claude plugin install wbs@wbs-agents
mkdir -p "$HOME/.claude/skills/wbs"
HERE="$(cd "$(dirname "$0")" && pwd)"
if [ -f "$HERE/shim/wbs/SKILL.md" ]; then
  cp "$HERE/shim/wbs/SKILL.md" "$HOME/.claude/skills/wbs/SKILL.md"
fi
echo "Done. Start Claude Code in a project folder and run /wbs:start (or /wbs)."
