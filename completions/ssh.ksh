#: | ssh | ssh known hosts |
set -A SSH_KNOWN_HOSTS ~/.ssh/known_hosts

if [ -f /etc/ssh/ssh_known_hosts ]; then
	SSH_KNOWN_HOSTS="${SSH_KNOWN_HOSTS[@]} /etc/ssh/ssh_known_hosts"
fi

HOST_LIST=$(awk \
	'{split($1,a,","); gsub("].*", "", a[1]); gsub("\\[", "", a[1]); print a[1] " root@" a[1]}' \
		$SSH_KNOWN_HOSTS | sort | uniq)

set -A complete_ssh -- $HOST_LIST
set -A complete_scp -- $HOST_LIST
set -A complete_mosh -- $HOST_LIST
