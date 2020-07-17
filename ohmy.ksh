#!/bin/ksh

#${DEBUG}

# Stub our load functions
paths() {
	return 0
}

load_extension() {
	return 0
}

load_completion() {
	return 0
}

set_prompt() {
	return 0
}

if [ -z $OHMYKSH_DIR ]; then
	echo "Please set OHMYKSH_DIR to the location of ohmyksh"
else
	LOAD_PATH="$OHMYKSH_DIR"

	. ${LOAD_PATH}/lib/loader.ksh

	set -A completions --
	set -A extensions --
fi
