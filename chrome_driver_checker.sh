#!/bin/bash

# get_display [USER] — Returns $DISPLAY of USER.
# If first param is omitted, then $LOGNAME will be used.
get_display () {
who \
| grep ${1:-$LOGNAME} \
| perl -ne 'if ( m!\(\:(\d+)\)$! ) {print ":$1.0\n"; $ok = 1; last} END {exit !$ok}'
}

DISPLAY=$(get_display) || exit
export DISPLAY

# echo "Let's check the latest available Chrome driver version."
last_version=$(curl -s http://chromedriver.storage.googleapis.com/LATEST_RELEASE)
# echo "The latest available Chrome driver version is" $last_version
if [ "$last_version" != "2.11" ]; then
	$(notify-send "Chrome driver $last_version" "Chrome Driver version $last_version is available")
fi
