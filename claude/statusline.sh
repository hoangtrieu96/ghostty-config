#!/bin/bash
input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name')
DIR=$(basename "$(echo "$input" | jq -r '.workspace.current_dir')")
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
REMAINING=$(echo "$input" | jq -r '.context_window.remaining_percentage // (100 - (.context_window.used_percentage // 0))' | cut -d. -f1)
LINES_ADDED=$(echo "$input" | jq -r '.cost.total_lines_added // 0')
LINES_REMOVED=$(echo "$input" | jq -r '.cost.total_lines_removed // 0')

CYAN='\033[36m'; MAGENTA='\033[35m'; BLUE='\033[34m'; GREEN='\033[32m'; YELLOW='\033[33m'; RED='\033[31m'; CLAUDE_ORANGE='\033[38;2;217;119;87m'; DARKGREEN='\033[38;2;31;95;31m'; RESET='\033[0m'

ICON_MODEL=$'\xef\x80\x87'
ICON_DIR=$'\xef\x81\xbb'
ICON_BRANCH=$'\xef\x90\x98'
ICON_CONTEXT=$'\xef\x87\x80'
ICON_CLOCK=$'\xef\x80\x97'

if [ "$REMAINING" -le 10 ]; then BAR_COLOR="$RED"
elif [ "$REMAINING" -le 30 ]; then BAR_COLOR="$YELLOW"
else BAR_COLOR="$GREEN"; fi

BAR_WIDTH=10
FILLED=$((REMAINING * BAR_WIDTH / 100))
EMPTY=$((BAR_WIDTH - FILLED))
BAR=""
[ "$FILLED" -gt 0 ] && printf -v FILL "%${FILLED}s" && BAR="${FILL// /█}"
[ "$EMPTY" -gt 0 ] && printf -v PAD "%${EMPTY}s" && BAR="${BAR}${PAD// /░}"

BRANCH=""
if git rev-parse --git-dir > /dev/null 2>&1; then
    BRANCH_NAME=$(git branch --show-current 2>/dev/null)
    DIRTY=""
    [ -n "$(git status --porcelain 2>/dev/null)" ] && DIRTY=" ${YELLOW}*${RESET}"
    [ -n "$BRANCH_NAME" ] && BRANCH=" | ${ICON_BRANCH} ${MAGENTA}${BRANCH_NAME}${RESET}${DIRTY}"
fi

LINES=""
if [ "$LINES_ADDED" != "0" ] || [ "$LINES_REMOVED" != "0" ]; then
    LINES=" | ${GREEN}+${LINES_ADDED}${RESET}/${RED}-${LINES_REMOVED}${RESET}"
fi

NOW=$(date "+%a %b %d %Y, %I:%M %p")

echo -e "${CLAUDE_ORANGE}${ICON_MODEL} [$MODEL]${RESET} ${BLUE}${ICON_DIR} ${DIR}${RESET}$BRANCH | ${BAR_COLOR}${ICON_CONTEXT} ${BAR} ${REMAINING}% context${RESET}$LINES"
echo -e "\033[37m${ICON_CLOCK} ${NOW}${RESET}"
