PASS_LIST=$(gopass ls -f)
set -A complete_gopass -- $PASS_LIST \
	audit \
	bin binary \
	clone completion config copy cp create \
	delete \
	edit \
	find fix fsck \
	generate git grep \
	h help hotp \
	init insert \
	jsonapi \
	list ls \
	mounts move mv \
	new \
	otp \
	recipients remove rm \
	search set setup show sync \
	templates totp \
	unclip update \
	version
