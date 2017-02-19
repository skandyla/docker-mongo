#!/bin/bash
mongoshell="mongo"
if [ "$AUTH" == "y" ] && [ -f $CONFIG_DIR/.admin_created ];then
  mongoshell="$mongoshell --username=$ADMIN_USER --password=$ADMIN_PWD --authenticationDatabase $ADMIN_AUTHENTICATION_DATABASE"
fi
echo $mongoshell
