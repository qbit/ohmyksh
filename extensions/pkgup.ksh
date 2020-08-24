#!/bin/ksh

pkgup() {
	local _up_url
	_up_url="https://pintobyte.com/pkgup/"
	[ ! -z $1 ] && _up_url=$1

	if which obsdpkgup >/dev/null 2>&1; then
		PKGUP_URL="$_up_url" obsdpkgup
	else
		echo "Please install obsdpkgup:"
		echo "  GO111MODULE=on go get -u github.com/neutralinsomniac/obsdpkgup"
	fi
}
