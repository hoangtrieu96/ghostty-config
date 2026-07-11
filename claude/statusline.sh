#!/bin/bash
input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name')
DIR=$(echo "$input" | jq -r '.workspace.current_dir')
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
REMAINING=$(echo "$input" | jq -r '.context_window.remaining_percentage // (100 - (.context_window.used_percentage // 0))' | cut -d. -f1)

CYAN='\033[36m'; MAGENTA='\033[35m'; BLUE='\033[34m'; GREEN='\033[32m'; YELLOW='\033[33m'; RED='\033[31m'; RESET='\033[0m'

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
    [ -n "$BRANCH_NAME" ] && BRANCH=" | ${MAGENTA}${BRANCH_NAME}${RESET}"
fi

echo -e "${CYAN}[$MODEL]${RESET} ${BLUE}${DIR}${RESET}$BRANCH | ${BAR_COLOR}${BAR} ${REMAINING}% remaining context${RESET}"
