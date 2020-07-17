#!/bin/ksh

_loaded() {
	${DEBUG}
	local _val=$1 _set

	shift
	for _set; do
		[[ $_val == "$_set" ]] && return 0
	done
	return 1
}

load() {
	local _e=$1
	[[ -x $_e ]] && \
		. $_e
}

load_extension() {
	${LOAD_EXTENSION_DEBUG}
	local _ext=$1 _l=${#extensions[@]} _n
	if ! _loaded "$_ext" "${extensions[@]}"; then
		${LOAD_EXTENSION_DEBUG}

		((_n=_l+1))

		extensions[$_n]=$_ext	
		load ${LOAD_PATH}/extensions/${_ext}.ksh
	else
		echo "Warning: extension '$_ext' already loaded"
	fi
}

load_completion() {
	${LOAD_COMPLETION_DEBUG}
	local _comp=$1 _l=${#completions[@]} _n
	if ! _loaded "$_comp" "${completions[@]}"; then
		${LOAD_COMPLETION_DEBUG}

		((_n=_l+1))

		completions[$_n]=$_comp	
		load ${LOAD_PATH}/completions/${_comp}.ksh
	else
		echo "Warning: completion '$_comp' already loaded"
	fi
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

reload_completions() {
	for _comp in ${completions[@]}; do
		load ${LOAD_PATH}/completions/${_comp}.ksh
	done
}

reload_extensions() {
	for _ext in ${extensions[@]}; do
		load ${LOAD_PATH}/extensions/${_ext}.ksh
	done
}

reload() {
	reload_completions
	reload_extensions
}

