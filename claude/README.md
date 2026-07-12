# Claude Code

Status line script for [Claude Code](https://claude.com/claude-code).

Two lines:
- Model, current directory, git branch (with a dirty-repo indicator and lines added/removed), and a colored bar for remaining context
- Current date/time

## Usage

Requires `jq` and a Nerd Font (for the icons). Point Claude Code's `statusLine` setting at this script, e.g. in `~/.claude/settings.json`:

```json
{
  "statusLine": {
    "type": "command",
    "command": "/path/to/claude/statusline.sh",
    "refreshInterval": 5
  }
}
```

`refreshInterval` (seconds) re-runs the script periodically so git status stays current without needing a new prompt.
