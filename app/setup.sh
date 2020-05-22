#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)
echo "------------ application setup ------------"

find $SCRIPT_DIR -name install.sh -exec sh {} \;
