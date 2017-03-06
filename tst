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

CMD="go test -i -check.v"
if [ "$#" -gt 1 ]; then
    CMD="$CMD -check.f $REST"
fi

echo $PACKAGE
echo $CMD

cd $PACKAGE
time $CMD
