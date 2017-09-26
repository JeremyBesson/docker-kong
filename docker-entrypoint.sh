#!/usr/local/bin/dumb-init /bin/bash
set -e

# Disabling nginx daemon mode
export KONG_NGINX_DAEMON="off"

FIXKONG=$(cat /fixkong)
echo "1" > /fixkong

if [ "$FIXKONG" == "" ]; then
   kong migrations up
   kong reload
fi 

echo $?


exec "$@"
