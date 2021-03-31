#: | man | man pages |
MAN_CACHE=$LOAD_PATH/cache/man
if [ ! -f $MAN_CACHE ]; then
	mkdir -p $(dirname ${MAN_CACHE})
	for i in /usr{,/X11R6,/local}{,/share}/man/{,cat,man}[1-9lnp]{,f,p}
	do
		test -d $i && ls $i
	done | rev | cut -d. -f2- | rev | sort -u > $MAN_CACHE
fi

set -A complete_man -- $(cat $MAN_CACHE)
