#: | man | man pages |
MAN_CACHE=$LOAD_PATH/cache/man
if [ ! -f $MAN_CACHE ]; then
	MANPATH=/usr/share/man man -k Nm~. | cut -d\( -f1 | tr -d , | \
		sort | \
		uniq > $MAN_CACHE
fi

set -A complete_man_1 -- $(cat $MAN_CACHE)

