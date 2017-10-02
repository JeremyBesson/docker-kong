#!/usr/local/bin/dumb-init /bin/bash
set -e

# Disabling nginx daemon mode
export KONG_NGINX_DAEMON="off"

# Setting default prefix (override any existing variable)
export KONG_PREFIX="/usr/local/kong"

# Prepare Kong prefix
if [ "$1" = "/usr/local/openresty/nginx/sbin/nginx" ]; then
	kong prepare -p "/usr/local/kong"
fi


#FIXKONG=$(cat /fixkong)
#echo "toto :"
#echo $FIXKONG
#echo "1" > /fixkong
#
#if [ "$FIXKONG" != "1" ]; then
kong migrations up
kong reload
exit 0
#fi 

echo $?


exec "$@"
