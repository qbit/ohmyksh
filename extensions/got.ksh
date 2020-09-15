#!/bin/ksh

# Thanks to jrick for this one:
# https://gist.github.com/jrick/d47e1be98609401e86ba0bd6bfbfc8fe
function got-push {
        local r
	r=$(set -e; got info | awk '$1 ~ "^repository:" {print $2}')
	if [ "$r" != "" ]; then
		(cd "$r" && git push "$@")
	else
		return 1
	fi
}

function got-sync {
	local _remote
	_remote=$1
	[ -z $_remote ] &&  _remote="origin"
	got fetch "$_remote" && got update -b "$_remote/master" && \
		got rebase master
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
