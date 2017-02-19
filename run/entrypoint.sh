#!bin/bash

set -m

# Docker entrypoint (pid 1), run as root
#[ "$1" = "mongod" ] || exec "$@" || exit $?

# Make sure that database is owned by user mongodb
#[ "$(stat -c %U /data/db)" = mongodb ] || chown -R mongodb /data/db

if  [ $CONFIG_DIR != "" ] && [ ! -d $CONFIG_DIR ]; then
  mkdir -vp $CONFIG_DIR
fi

if [[ "$1" == "mongo*" ]]; then
  exec "$@"
fi

if  [ "$CONFIG_SERVERS" == "" ]; then
  /run/mongod/entrypoint.sh &
else
  /run/mongos/entrypoint.sh &
fi

fg
