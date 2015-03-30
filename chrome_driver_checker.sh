#!/bin/sh

init_notify() {
    user=$LOGNAME
    pids=`pgrep -u $user nautilus`
    for pid in $pids; do
        # find DBUS session bus for this session
        DBUS_SESSION_BUS_ADDRESS=`grep -z DBUS_SESSION_BUS_ADDRESS /proc/$pid/environ | sed -e 's/DBUS_SESSION_BUS_ADDRESS=//'`
        # use it
        export DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS
    done
}

notify() {
    if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
        init_notify
    fi
    
    title=$1
    text=$2
    timeout=$3
    
    if [ -z "$title" ]; then
        return
    fi
    if [ -z "$text" ]; then
        text=$title
    fi
    if [ -z "$timeout" ]; then
        timeout=5000
    fi
    
    notify-send "$title" "$text" -t $timeout
}

# echo "Let's check the latest available Chrome driver version."
last_version=$(curl -s http://chromedriver.storage.googleapis.com/LATEST_RELEASE)
# echo "The latest available Chrome driver version is" $last_version
if [ "$last_version" != "2.13" ]; then
    $(notify "Chrome driver $last_version" "Chrome Driver version $last_version is available" 5000)
fi