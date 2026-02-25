#!/bin/bash
# Claude Code Usage Status Line — Uninstaller
set -euo pipefail

echo "Uninstalling Claude usage status line..."
rm -f "$HOME/.claude/statusline.sh" "$HOME/.claude/usage_cache.json"
rmdir "$HOME/.claude/usage_cache.json.lock" 2>/dev/null || true
if [ -f "$HOME/.claude/settings.json" ]; then
  UPDATED=$(jq 'del(.statusLine)' "$HOME/.claude/settings.json")
  echo "$UPDATED" > "$HOME/.claude/settings.json"
  echo "Removed statusLine from ~/.claude/settings.json"
fi
echo "Done."
