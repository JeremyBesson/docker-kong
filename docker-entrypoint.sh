#!/bin/sh
set -e

# Disabling nginx daemon mode
export KONG_NGINX_DAEMON="off"

# Setting default prefix (override any existing variable)
export KONG_PREFIX="/usr/local/kong"

#if ["psql -h kong-database -U kong -d kong -c \"SELECT 1\"" ]; then
#
    kong migrations up #-c /usr/local/kong/nginx.conf 
#
    kong reload
#
#fi

# Prepare Kong prefix
if [ "$1" = "/usr/local/openresty/nginx/sbin/nginx" ]; then
	kong prepare -p "/usr/local/kong"
fi


exec "$@"
