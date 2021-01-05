KEYCHAIN_OPTS=${KEYCHAIN_OPTS:---gpg2 --inherit any --agents ssh,gpg -q -Q}
KEYCHAIN_CONF="$HOME/.keychain/$(uname -n)-sh"

keychain ${KEYCHAIN_OPTS}

[ -f "${KEYCHAIN_CONF}" ] && . "${KEYCHAIN_CONF}"
[ -f "${KEYCHAIN_CONF}-gpg" ] && . "${KEYCHAIN_CONF}-gpg"

