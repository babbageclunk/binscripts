#!/bin/bash

BASEDIR=~/juju

DIR=$1
REST=${@:2}

if [[ $DIR == /* ]]; then
    PACKAGE=$DIR
else
    PACKAGE=$BASEDIR/$DIR
fi

CMD="time go test -check.v"
if [ "$#" -gt 1 ]; then
    CMD="$CMD -check.f $REST"
fi

echo $CMD

cd $PACKAGE
$CMD
