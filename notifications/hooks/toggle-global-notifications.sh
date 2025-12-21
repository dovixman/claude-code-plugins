#!/bin/bash
# Toggle global notification status

LOCK_FILE="$HOME/.claude/.notification_sessions.json"

# Create file if missing
if [[ ! -f "$LOCK_FILE" ]]; then
  echo '{"global_enabled":true,"sessions":{}}' > "$LOCK_FILE"
fi

# Get current value (default true if not set)
current=$(jq -r 'if has("global_enabled") then .global_enabled else true end' "$LOCK_FILE")

# Toggle
if [[ "$current" == "true" ]]; then
  new_value="false"
else
  new_value="true"
fi

# Update file
jq --argjson val "$new_value" '.global_enabled = $val' "$LOCK_FILE" > "$LOCK_FILE.tmp"
mv "$LOCK_FILE.tmp" "$LOCK_FILE"

# Output result
if [[ "$new_value" == "true" ]]; then
  echo "enabled"
else
  echo "disabled"
fi
