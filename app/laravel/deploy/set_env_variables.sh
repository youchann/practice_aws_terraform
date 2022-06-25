#!/bin/zsh

echo DB_HOST=$DB_HOST >> app/laravel/.env &&
echo DB_DATABASE=$DB_DATABASE >> app/laravel/.env &&
echo DB_USERNAME=$DB_USERNAME >> app/laravel/.env &&
echo DB_PASSWORD=$DB_PASSWORD >> app/laravel/.env &&
echo APP_NAME=$APP_NAME >> app/laravel/.env &&
echo APP_KEY=$APP_KEY >> app/laravel/.env &&
echo APP_ENV=$APP_ENV >> app/laravel/.env &&
echo APP_DEBUG=$APP_DEBUG >> app/laravel/.env &&
echo 'Laravel env variables configured'
