# macOS Claude Notifications

macOS native notifications for Claude Code using `terminal-notifier`. Get notified when Claude finishes tasks or needs your input.

## Features

- **Task Complete** notifications when Claude finishes working
- **Input Required** notifications when Claude needs permission or input
- **Per-session toggle** - disable notifications for specific sessions
- **Global toggle** - disable all notifications at once
- Clicking notifications brings your terminal back to focus
- **Session ID access** - use your session ID in custom commands

## Dependencies

- [terminal-notifier](https://github.com/julienXX/terminal-notifier) - Install via Homebrew:
  ```bash
  brew install terminal-notifier
  ```
- [jq](https://stedolan.github.io/jq/) - Install via Homebrew:
  ```bash
  brew install jq
  ```

## Installation

Install this plugin from the marketplace or add it to your Claude Code plugins. The hooks are automatically configured.

## Usage

### Slash Commands

| Command | Description |
|---------|-------------|
| `/toggle-session-notifications` | Toggle notifications for current session only |
| `/toggle-global-notifications` | Toggle notifications globally (all sessions) |

### Session ID

The SessionStart hook injects `CLAUDE_CURRENT_SESSION_ID` into your environment. This enables:

- **Ask Claude** - You can ask Claude for your current session ID at any time
- **Custom commands** - Use `$CLAUDE_CURRENT_SESSION_ID` in your own slash commands
- **Bash scripts** - Access the variable in any bash command executed during the session

Example in a custom command:
```bash
echo "Current session: $CLAUDE_CURRENT_SESSION_ID"
```

### Notification Behavior

- **Global disabled**: No notifications sent, session toggle shows warning
- **Session disabled**: No notifications for that session only
- **Both enabled**: Notifications sent normally

## Configuration

### Terminal App

By default, clicking a notification opens Ghostty. To change this, set `CLAUDE_NOTIFICATIONS_TERMINAL` in your `~/.claude/settings.json`:

```json
{
  "env": {
    "CLAUDE_NOTIFICATIONS_TERMINAL": "com.apple.Terminal"
  }
}
```

Common terminal bundle IDs:
| Terminal | Bundle ID |
|----------|-----------|
| Terminal.app | `com.apple.Terminal` |
| iTerm2 | `com.googlecode.iterm2` |
| Ghostty | `com.mitchellh.ghostty` |
| Alacritty | `org.alacritty` |
| Kitty | `net.kovidgoyal.kitty` |
| Warp | `dev.warp.Warp-Stable` |

Find your terminal's bundle ID:
```bash
osascript -e 'id of app "YourTerminalName"'
```

### Notification Settings File

Settings are stored in `~/.claude/.notification_sessions.json`:

```json
{
  "global_enabled": true,
  "sessions": {
    "session-id-1": true,
    "session-id-2": false
  }
}
```

## Troubleshooting

### Notifications not appearing
1. Ensure `terminal-notifier` is installed: `which terminal-notifier`
2. Check macOS notification settings for Terminal Notifier
3. Verify the plugin is installed and enabled

### Session toggle not working
1. Restart Claude Code to trigger SessionStart hook
2. Verify the plugin is installed correctly

### Wrong terminal opens on click
Set `CLAUDE_NOTIFICATIONS_TERMINAL` in your settings (see Configuration above)
