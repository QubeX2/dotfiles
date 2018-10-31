#!/bin/sh

if [ "$1" == "start" ]; then
    if [ -f /tmp/laravel.pid ]; then
        echo "Already started..."
    else
        cd ~/Sites/fwork5
        laravel-echo-server start &
        echo $! > /tmp/laravel.pid

        php artisan fwork:telavox &
        echo $! > /tmp/telavox.pid

        yarn run watch &
        echo $! > /tmp/yarn.pid
    fi

elif [ "$1" == "stop" ]; then
    if [ -f /tmp/laravel.pid ]; then
        kill `cat /tmp/laravel.pid`
        rm /tmp/laravel.pid
    fi
    if [ -f /tmp/telavox.pid ]; then
        kill `cat /tmp/telavox.pid`
        rm /tmp/telavox.pid
    fi
    if [ -f /tmp/yarn.pid ]; then
        kill `cat /tmp/yarn.pid`
        rm /tmp/yarn.pid
    fi
else

    echo "Usage: fw5-dev-start [start|stop]"
fi


