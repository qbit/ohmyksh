#: | git | add, fetch... |
set -A complete_git_1 -- \
	$(git --list-cmds=main) \
	$(git config --get-regexp ^alias\. | awk -F '[\. ]' '{ print $2 }')
