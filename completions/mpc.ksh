set -A complete_mpc_1 -- \
	add \
	cdprev channels clear clearerror \
	consume crop crossfade current \
	del disable \
	enable \
	find findadd \
	idle idleloop insert \
	list listall load ls lsplaylists \
	mixrampdb mixrampdelay move \
	next \
	outputs outputset \
	pause pause-if-playing play playlist prev prio \
	random repeat replaygain rescan rm \
	save search searchadd searchplay seek \
	sendmessage shuffle single stats \
	sticker stop subscribe \
	toggle toggleoutput \
	update \
	version volume \
	waitmessage

set -A complete_mpc_2 -- $(mpc lsplaylists | sort)
