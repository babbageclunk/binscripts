#!/bin/bash

BASEDIR=~/juju

DIR=$1
REST=${@:2}

if [[ $DIR == . ]]; then
    PACKAGE=$(pwd)
elif [[ $DIR == /* ]]; then
    PACKAGE=$DIR
else
    PACKAGE=$BASEDIR/$DIR
fi

INSTALL="go test -i -v"
CMD="go test -check.v"
if [ "$#" -gt 1 ]; then
    CMD="$CMD -check.f $REST"
fi

echo $PACKAGE
echo $INSTALL
echo $CMD

cd $PACKAGE
$INSTALL
time $CMD
