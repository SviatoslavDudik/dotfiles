#!/bin/zsh

mbsync -Va
notmuch new
notmuch_add_tags
new=$(notmuch count tag:unread)
[ $new -gt 0 ] || exit 0
notify-send "Mail" "You have $new new mails"

