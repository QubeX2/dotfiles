#!/bin/sh
n v12
if [ "$1" == "start" ]; then
    if [ -f /tmp/fw5-les.pid ]; then
        echo "Already started..."
    else
        cd ~/Sites/fwork5
        laravel-echo-server start &
        echo $! > /tmp/fw5-les.pid

        php artisan fwork:telavox &
        echo $! > /tmp/fw5-telavox.pid

        yarn run watch &
        echo $! > /tmp/fw5-yarn.pid

        # php artisan horizon &
        # echo $! > /tmp/fw5-horizon.pid

        # php artisan queue:work database --queue=default --timeout=240 &
        # echo $! > /tmp/fw5-queue.pid
    fi

elif [ "$1" == "stop" ]; then
    if [ -f /tmp/fw5-les.pid ]; then
        kill `cat /tmp/fw5-les.pid`
        rm /tmp/fw5-les.pid
    fi
    if [ -f /tmp/fw5-telavox.pid ]; then
        kill `cat /tmp/fw5-telavox.pid`
        rm /tmp/fw5-telavox.pid
    fi
    if [ -f /tmp/fw5-yarn.pid ]; then
        kill `cat /tmp/fw5-yarn.pid`
        rm /tmp/fw5-yarn.pid
    fi
    # if [ -f /tmp/fw5-horizon.pid ]; then
        # kill `cat /tmp/fw5-horizon.pid`
        # rm /tmp/fw5-horizon.pid
    # fi
    # if [ -f /tmp/fw5-queue.pid ]; then
        # kill `cat /tmp/fw5-queue.pid`
        # rm /tmp/fw5-queue.pid
    # fi
elif [ "$1" == "status" ]; then
    if [ -f /tmp/fw5-les.pid ]; then
        ps u -p `cat /tmp/fw5-les.pid`
    fi
    if [ -f /tmp/fw5-telavox.pid ]; then
        ps u -p `cat /tmp/fw5-telavox.pid`
    fi
    if [ -f /tmp/fw5-yarn.pid ]; then
        ps u -p `cat /tmp/fw5-yarn.pid`
    fi
else

    echo "Usage: fw5-init [start|stop|status]"
fi


