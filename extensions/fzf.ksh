zpatch() {
	if [ -z $OHMYPATCHES ]; then
		echo "please set OHMYPATCHES to the directory that contains your patches."
		return 1
	fi

	local _patch_file="$(ls ${OHMYPATCHES}/* | fzf)"
	/usr/bin/patch $@ < "${_patch_file}"
}

zh() {
	fc -ln | eval $(fzf)
}

zpkg() {
	local _pkg _usage

	_usage="zpkg add|rm"

	if [ ! -f /usr/local/share/sqlports ]; then
		echo "please install sqlports"
		return 1
	fi

	if [ ! -e /usr/local/bin/sqlite3 ]; then
		echo "please install sqlite3"
		return 1
	fi

	if [ -z $1 ]; then
	       	echo $_usage
		return 1
	else
		case $1 in
			add)
				_pkg=$(/usr/local/bin/sqlite3 -separator " " \
					/usr/local/share/sqlports \
					"select distinct fullpkgname from Ports;" |\
				       	fzf --preview "/usr/sbin/pkg_info {1}")
				[ ! -z $_pkg ] && ${OHMY_DO} /usr/sbin/pkg_add $_pkg
				;;
			rm)
				_pkg=$(ls -1 /var/db/pkg | fzf --preview "/usr/sbin/pkg_info {1}")
				[ ! -z $_pkg ] && ${OHMY_DO} /usr/sbin/pkg_delete $_pkg
				;;
			*)
				echo $_usage
		esac
	fi
}
