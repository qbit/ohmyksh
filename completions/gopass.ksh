#: | gopass | audit, config... |
PASS_LIST=$(gopass ls -f)
set -A complete_gopass -- $PASS_LIST agent audit binary bin clone completion config copy cp create new delete remove rm edit set find search fsck generate git-credential jsonapi otp totp hotp git grep history hist init insert list ls move mv mounts recipients setup show sync templates unclip update version xc help h
