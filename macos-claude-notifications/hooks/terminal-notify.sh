#!/bin/bash
# Terminal notification script for Claude Code hooks
# Sends macOS native notifications via terminal-notifier

# Read JSON from stdin and extract session_id
STDIN_JSON=$(cat)
SESSION_ID=$(echo "$STDIN_JSON" | jq -r '.session_id // empty')
LOCK_FILE="$HOME/.claude/.notification_sessions.json"

# Create config file if missing
if [[ ! -f "$LOCK_FILE" ]]; then
  echo '{"global_enabled":true,"sessions":{}}' > "$LOCK_FILE"
fi

# Check global notification setting (default true)
GLOBAL_ENABLED=$(jq -r 'if has("global_enabled") then .global_enabled else true end' "$LOCK_FILE")
if [[ "$GLOBAL_ENABLED" == "false" ]]; then
  exit 0
fi

# Check session-based notification status
if [[ -n "$SESSION_ID" ]]; then
  # Get notification status for this session (default true if not set)
  # Note: Can't use "// true" because jq treats false as falsy and would return true
  SESSION_ENABLED=$(jq -r --arg sid "$SESSION_ID" 'if .sessions | has($sid) then .sessions[$sid] else true end' "$LOCK_FILE")

  if [[ "$SESSION_ENABLED" == "false" ]]; then
    exit 0
  fi
fi

EVENT_TYPE="${1:-unknown}"
SENDER="com.anthropic.claudefordesktop"
GROUP_ID="${SESSION_ID:-claude-code}"

# Terminal app to activate when notification is clicked
# Change this to your terminal's bundle ID (e.g., com.apple.Terminal, com.googlecode.iterm2)
TERMINAL_APP="${CLAUDE_NOTIFICATIONS_TERMINAL:-com.mitchellh.ghostty}"

case "$EVENT_TYPE" in
  "stop")
    SUBTITLE="Task Complete"
    MESSAGE="Claude has finished working and is ready for your next request."
    SOUND="default"
    ;;
  "permission")
    SUBTITLE="Input Required"
    MESSAGE="Claude needs your permission or input to continue."
    SOUND="Ping"
    ;;
  *)
    SUBTITLE="Event: $EVENT_TYPE"
    MESSAGE="Claude triggered an event."
    SOUND="default"
    ;;
esac

terminal-notifier -title "Claude Code" -subtitle "$SUBTITLE" -message "$MESSAGE" -sound "$SOUND" -sender "$SENDER" -group "$GROUP_ID" -activate "$TERMINAL_APP"

exit 0
