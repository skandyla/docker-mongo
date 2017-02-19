#!/bin/bash
if [ ! -f $CONFIG_DIR/key ]; then
    touch $CONFIG_DIR/key
    echo $ADMIN_PWD > $CONFIG_DIR/key
    chmod 600 $CONFIG_DIR/key
fi
