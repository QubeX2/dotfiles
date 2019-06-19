#!/bin/sh

if [ "$1" == "start" ]; then
    if [ -f /tmp/kc-yearn.pid ]; then
        echo "Already started..."
    else
        cd ~/Sites/kundcenter
        yarn run watch &
        echo $! > /tmp/kc-yarn.pid
    fi

elif [ "$1" == "stop" ]; then
    if [ -f /tmp/kc-yarn.pid ]; then
        kill `cat /tmp/kc-yarn.pid`
        rm /tmp/kc-yarn.pid
    fi
else

    echo "Usage: kc-init [start|stop]"
fi


