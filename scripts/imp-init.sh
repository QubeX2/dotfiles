#!/bin/sh
n 14
if [ "$1" == "start" ]; then
    if [ -f /tmp/imp-les.pid ]; then
        echo "Already started..."
    else
        cd ~/Sites/impecta
        yarn run watch &
        echo $! > /tmp/imp-les.pid
    fi

elif [ "$1" == "stop" ]; then
    if [ -f /tmp/imp-les.pid ]; then
        kill `cat /tmp/imp-les.pid`
        rm /tmp/imp-les.pid
    fi
else

    echo "Usage: imp-init [start|stop]"
fi


