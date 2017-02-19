#!/bin/bash
mongoshell=$(/run/misc/mongoshell.sh)
if [ ! -f ${CONFIG_DIR}/.db_owner_created ] && [ "$DB_NAME" != "" ] && [ "$CONFIG_SERVERS" == "" ]; then
    #echo $mongoshell $DB_NAME --eval "db.createUser({user: '$DB_USER', pwd: '$DB_PWD', roles:[{role: 'dbOwner', db: '$DB_NAME'}]});"
    $mongoshell $DB_NAME --eval "db.createUser({user: '$DB_USER', pwd: '$DB_PWD', roles:[{role: 'dbOwner', db: '$DB_NAME'}]});"
    touch  ${CONFIG_DIR}/.db_owner_created
fi
