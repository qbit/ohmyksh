#: | man | man pages |
MAN_CACHE=$LOAD_PATH/cache/man
if [ ! -f $MAN_CACHE ]; then
	mkdir -p `dirname ${MAN_CACHE}`
	ls /usr/{share,X11R6,local}/man/man[1-9] | sort -u > $MAN_CACHE
fi

set -A complete_man_1 -- $(cat $MAN_CACHE)

