#!/bin/ksh

# Thanks to jrick for this one:
# https://gist.github.com/jrick/d47e1be98609401e86ba0bd6bfbfc8fe
function got-push {
	local p="$PWD"
        while [ ! -e "$p/.got/repository" ]; do
                if [ "$p" = "/" ]; then
                        echo "$PWD: not a got checkout" 1>&2
                        return 1
                fi
                p=$(dirname "$p")
        done
        local r
        read r < "$p/.got/repository"
	(cd "$r" && git push "$@")
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
