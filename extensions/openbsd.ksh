src() {
	cd /usr/src/*/$1 || return
}

port() {
	cd /usr/ports/*/$1 2>/dev/null || \
		cd /usr/ports/*/*/$1 2>/dev/null || \
		return
}

pclean() {
	find . -name \*.orig -exec rm {} \;
	find . -size 0 -exec rm {} \;
}

maintains() {
	cd /usr/ports/*/$1 > /dev/null 2>&1 && \
		make show=MAINTAINER || \
		echo "No port '/usr/ports/*/$1'"
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
