#!/bin/sh
n 13.10.1
if [ "$1" == "start" ]; then
    if [ -f /tmp/gs-les.pid ]; then
        echo "Already started..."
    else
        cd ~/Sites/golf-service-system
        laravel-echo-server start &
        echo $! > /tmp/gs-les.pid

        npm run watch-poll &
    fi

elif [ "$1" == "stop" ]; then
    if [ -f /tmp/gs-les.pid ]; then
        kill `cat /tmp/gs-les.pid`
        rm /tmp/gs-les.pid
    fi
else

    echo "Usage: gs-init [start|stop]"
fi


