#!/bin/ksh

extension_loaded() {
	#${DEBUG}
	local _ext=$1

	for c in ${extensions[@]}; do
		if [ "${c}" == "${_ext}" ]; then
			return 1
		fi
	done
	return 0
}

load() {
	local _e=$1
	[[ -x $_e ]] && \
		. $_e
}

load_extension() {
	${LOAD_EXTENSION_DEBUG}
	local _ext=$1
	if [ ! $(extension_loaded $_ext) ]; then
		${LOAD_EXTENSION_DEBUG}
		extensions[${#extensions[@]}]=$_ext	
		load ${LOAD_PATH}/extensions/${_ext}.ksh
	else
		echo "Warning: extension already loaded"
	fi
}

load_completion() {
	${LOAD_COMPLETION_DEBUG}
	local _comp=$1
	load ${LOAD_PATH}/completions/${_comp}.ksh
}

set_prompt() {
	${PROMPT_DEBUG}
	local _prmpt=$1

	load ${LOAD_PATH}/prompts/${_prmpt}.ksh
}

paths() {
	${PATHS_DEBUG}
	local _path_list="$@"
	for p in ${_path_list[@]}; do
		${PATHS_DEBUG}
		[[ -d "${p}" ]] && PATH="${PATH}:$p"
	done
	export PATH
}
