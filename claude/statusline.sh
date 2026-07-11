#!/bin/bash
input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name')
DIR=$(basename "$(echo "$input" | jq -r '.workspace.current_dir')")
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
REMAINING=$(echo "$input" | jq -r '.context_window.remaining_percentage // (100 - (.context_window.used_percentage // 0))' | cut -d. -f1)
USED_TOKENS=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
TOTAL_TOKENS=$(echo "$input" | jq -r '.context_window.context_window_size // 0')

format_tokens() {
  awk -v n="$1" 'BEGIN {
    if (n >= 1000000) {
      m = n / 1000000
      if (m == int(m)) printf "%dm", m
      else printf "%.1fm", m
    } else if (n >= 1000) {
      k = n / 1000
      if (k == int(k)) printf "%dk", k
      else printf "%.1fk", k
    } else printf "%d", n
  }'
}
USED_TOKENS_FMT=$(format_tokens "$USED_TOKENS")
TOTAL_TOKENS_FMT=$(format_tokens "$TOTAL_TOKENS")

CYAN='\033[36m'; MAGENTA='\033[35m'; BLUE='\033[34m'; GREEN='\033[32m'; YELLOW='\033[33m'; RED='\033[31m'; CLAUDE_ORANGE='\033[38;2;217;119;87m'; DARKGREEN='\033[38;2;31;95;31m'; RESET='\033[0m'

ICON_MODEL=$'\xef\x80\x87'
ICON_DIR=$'\xef\x81\xbb'
ICON_BRANCH=$'\xef\x90\x98'
ICON_CONTEXT=$'\xef\x87\x80'
ICON_TOKENS=$'\xef\x94\x9e'
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
    [ -n "$BRANCH_NAME" ] && BRANCH=" | ${ICON_BRANCH} ${MAGENTA}${BRANCH_NAME}${RESET}"
fi

NOW=$(date "+%a %b %d %Y, %I:%M %p")

echo -e "${CLAUDE_ORANGE}${ICON_MODEL} [$MODEL]${RESET} ${BLUE}${ICON_DIR} ${DIR}${RESET}$BRANCH | ${BAR_COLOR}${ICON_CONTEXT} ${BAR} ${REMAINING}% context${RESET} | ${CYAN}${ICON_TOKENS} ${USED_TOKENS_FMT}/${TOTAL_TOKENS_FMT} tokens${RESET}"
echo -e "\033[37m${ICON_CLOCK} ${NOW}${RESET}"
