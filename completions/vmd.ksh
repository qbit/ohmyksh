#: | vmd | vmctl commands and VM names |
pgrep -fq '/usr/sbin/vmd'
if [ $? = 0 ]; then
	set -A complete_vmctl_1 -- console load reload start stop reset status send receive
	set -A complete_vmctl -- $(vmctl status | awk '!/NAME/{print $NF}')

fi
