#!/bin/sh

mbsync -Va
new=$(find ~/Mail/gmail/INBOX/{cur,new} -type f | grep -v -e "S$" | wc -l)
[ $new -gt 0 ] || exit 0
notify-send "Mail" "You have $new new mails"
/home/archie/.tools/update_status

