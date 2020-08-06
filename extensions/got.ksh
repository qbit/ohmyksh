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

