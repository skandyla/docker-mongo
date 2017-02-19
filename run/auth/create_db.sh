#!/bin/bash
if [ ! -f $CONFIG_DIR/.db_created ] && [ "$DB_NAME" != "" ] && [ "$CONFIG_SERVERS" == "" ]; then
    mongoshell=$(/run/misc/mongoshell.sh)
    #echo  $mongoshell $DB_NAME --eval "db"
    $mongoshell $DB_NAME --eval "db"
    touch $CONFIG_DIR/.db_created
fi
