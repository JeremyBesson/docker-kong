#!/usr/local/bin/dumb-init /bin/bash
set -e

# Disabling nginx daemon mode
export KONG_NGINX_DAEMON="off"

kong migrations up 

echo $?

kong reload 2&>/dev/null

echo $?


exec "$@"
