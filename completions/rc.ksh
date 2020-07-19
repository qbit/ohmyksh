#: | rc | OpenBSD rc scripts and rc commands |
set -A complete_rcctl_1 -- disable enable get ls order set restart start stop
set -A complete_rcctl_2 -- $(rcctl ls all)
