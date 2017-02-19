#!/bin/bash
mongoshell=$(/run/misc/mongoshell.sh)
if [ "$MASTER" != "" ] && [ ! -f $CONFIG_DIR/.master_set ]; then
  echo $mongoshell admin --quiet --eval "var conf = rs.conf(); conf.members[0].host='$MASTER'; rs.reconfig(conf)"
  $mongoshell admin --quiet --eval "var conf = rs.conf(); conf.members[0].host='$MASTER'; rs.reconfig(conf)"
  /run/mongod/replSet/wait_until_rs_configured.sh
  touch $CONFIG_DIR/.master_set
fi
