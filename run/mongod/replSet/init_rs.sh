#!/bin/bash
mongoshell=$(/run/misc/mongoshell.sh)
if [ "$MASTER" != "" ] && [ ! -f $CONFIG_DIR/.rs_init ]; then
  echo $mongoshell admin --quiet --eval "rs.initiate();"
  $mongoshell admin --quiet --eval "rs.initiate();"
  /run/mongod/replSet/wait_until_rs_configured.sh
  touch $CONFIG_DIR/.rs_init
fi
