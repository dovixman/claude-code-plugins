#!/bin/bash
# Toggle notification status for the current session

SESSION_ID="${CLAUDE_CURRENT_SESSION_ID:-}"
LOCK_FILE="$HOME/.claude/.notification_sessions.json"

if [[ -z "$SESSION_ID" ]]; then
  echo "Error: CLAUDE_CURRENT_SESSION_ID not set. Try restarting Claude Code."
  exit 1
fi

# Create file if missing
if [[ ! -f "$LOCK_FILE" ]]; then
  echo '{"global_enabled":true,"sessions":{}}' > "$LOCK_FILE"
fi

# Check global notification status
global_enabled=$(jq -r 'if has("global_enabled") then .global_enabled else true end' "$LOCK_FILE")

if [[ "$global_enabled" == "false" ]]; then
  echo -e "⚠️  \033[1;33mGlobal notifications are disabled.\033[0m Use \033[48;5;238m\033[1;37m /toggle-global-notifications \033[0m to enable them first."
  exit 0
fi

# Get current value (default true if not set)
# Note: Can't use "// true" because jq treats false as falsy
current=$(jq -r --arg sid "$SESSION_ID" 'if .sessions | has($sid) then .sessions[$sid] else true end' "$LOCK_FILE")

# Toggle
if [[ "$current" == "true" ]]; then
  new_value="false"
else
  new_value="true"
fi

# Update file
jq --arg sid "$SESSION_ID" --argjson val "$new_value" '.sessions[$sid] = $val' "$LOCK_FILE" > "$LOCK_FILE.tmp"
mv "$LOCK_FILE.tmp" "$LOCK_FILE"

# Output result
if [[ "$new_value" == "true" ]]; then
  echo "enabled"
else
  echo "disabled"
fi
