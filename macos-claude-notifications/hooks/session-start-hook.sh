#!/bin/bash
# SessionStart hook: Capture session_id and save to CLAUDE_ENV_FILE
# This enables per-session notification toggles

# Read JSON from stdin and extract session_id
SESSION_ID=$(cat | jq -r '.session_id // empty')

if [[ -n "$CLAUDE_ENV_FILE" && -n "$SESSION_ID" ]]; then
  echo "export CLAUDE_CURRENT_SESSION_ID=\"$SESSION_ID\"" >> "$CLAUDE_ENV_FILE"
fi

exit 0
