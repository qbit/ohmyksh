#: | git | add, fetch... |
set -A complete_git_1 -- \
	`man -cT man git | grep -o 'git-[a-z-]*' | sort -u | cut -d '-' -f2-` \
	`git config --get-regexp ^alias\. | awk -F '[\. ]' '{ print $2 }'`
