#! /bin/bash

if [ "$1" == 'up' ]; then
cd ..
elif [ "$1" == 'back' ]; then
cd $OLDPWD
else
cd "$1"
fi