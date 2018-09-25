#!/bin/sh

cd ~/Sites/fwork5
laravel-echo-server start &
php artisan fwork:telavox &
yarn run watch &

