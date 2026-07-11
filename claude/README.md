# Claude Code

Status line script for [Claude Code](https://claude.com/claude-code).

Shows model name, current directory, git branch, and a colored bar for remaining context.

## Usage

Requires `jq`. Point Claude Code's `statusLine` setting at this script, e.g. in `~/.claude/settings.json`:

```json
{
  "statusLine": {
    "type": "command",
    "command": "/path/to/claude/statusline.sh"
  }
}
```
