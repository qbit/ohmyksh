src() {
	cd /usr/src/*/$1 || return
}

port() {
	cd /usr/ports/*/$1 2>/dev/null || \
		cd /usr/ports/*/*/$1 2>/dev/null || \
		return
}

port_grep() {
	local _usage
	_usage="port_grep [file] [pattern]"
	[ -z $1 ] || [ -z $2 ] && echo $_usage
	[ ! -z $1 ] && [ ! -z $2 ] && find /usr/ports -iname "${1}" -exec grep -iH ${2} {} \;
}

pclean() {
	find . -name \*.orig -exec rm {} \;
	find . -size 0 -exec rm {} \;
}

revert_diffs() {
	for i in $(find . -name \*.orig); do
		F=$(echo $i | sed 's/\.orig//')
		mv -v "$i" "$F"
	done
}

cdw() {
	cd $(make show=WRKSRC)
}

maintains() {
	(
		cd /usr/ports/*/$1 > /dev/null 2>&1 && \
			make show=MAINTAINER || \
			echo "No port '/usr/ports/*/$1'"
	)
}

seq() {
	start=$1
	end=$2
	if echo "$start" | egrep -q '^[0-9]+$'; then
		if [ "$start" -lt "$end" ]; then
			while [ $start -le "${end}" ]; do
				printf "%d\\n" "$start"
				start=$((start + 1))
			done
		else
			while [ $start -ge "${end}" ]; do
				printf "%d\\n" "$start"
				start=$((start - 1))
			done
		fi
	else
		start=$(printf "%d" \'$start)
		end=$(printf "%d" \'$end)
		if [ "$start" -lt "$end" ]; then
			while [ $start -le "${end}" ]; do
				printf "\x$(printf %x $start)\\n"
				start=$((start + 1))
			done
		else
			while [ $start -ge "${end}" ]; do
				printf "\x$(printf %x $start)\\n"
				start=$((start - 1))
			done
		fi
	fi
}
