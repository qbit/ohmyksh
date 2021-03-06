#!/bin/ksh

# Thanks to jrick for this one:
# https://gist.github.com/jrick/d47e1be98609401e86ba0bd6bfbfc8fe
function got-push {
        local r
	r=$(set -e; got info | awk '$1 ~ "^repository:" {print $2}')
	[ -z "$r" ] && return 1
	(cd "$r" && git push "$@")
}

function got-sync {
	local _remote _info _branch
	_remote=$1
	_info="$(got info)"
	_branch="$(echo "$_info" | awk '/branch reference:/ {l = split($NF, a, "/"); print a[l]}')"
	[ -z $_remote ] && _remote="origin"
	[ -z $_branch ] && _branch="main"
	got fetch "$_remote" && got update -b "$_remote/$_branch" && \
		got rebase $_branch
}

function got-clean {
	local _opt
	_opt=$1
	for f in $(got status | grep ^? | awk '{print $2}'); do
		case "$_opt" in
			-f)
				rm -vf "$f"
				;;
			-i)
				rm -vi "$f"
				;;
			*)
				echo "Use -f or -i to actually remove files."
				echo "rm $f"
				;;
		esac
	done
}

function got-commit-v {
	local _width _session _args

	_args="$@"

	tmux split-window -p 60

	tmux select-pane -t 2
	tmux send-keys "got diff $_args | less" C-m

	tmux select-pane -t 1
	tmux send-keys "clear" C-m
	tmux send-keys "got commit $_args"
}

function __got_ps1 {
	local _format _branch _status
	_format=$1
	_branch=$(got branch 2>/dev/null | grep -v conf_set_now)
	_status=$?	
	if [ $_status == 0 ]; then
		printf "$_format" $_branch
	fi
}
