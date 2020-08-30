#! /bin/bash

q(){
namearg="$1"
args=( "$@" )
unset args[0]

if [ "$namearg" == 'list' ]; then
    if [ "$2" == 'all' ]; then
        ls -a
    else
        ls
    fi
elif [ "$namearg" == 'download' ]; then
    if [ "${args[1]}" == 'to' ]; then
        wget "${args[0]}" -P "${args[2]}"
    else
        wget "${args[0]}" -P .
    fi
elif [ "$namearg" == 'go' ]; then
    if [ "$2" == 'up' ]; then
        cd ..
    elif [ "$2" == 'back' ]; then
        cd $OLDPWD
    else
    cd "$2"
    fi
else
echo "qError: No argument given"
exit
fi
echo "Command $@ executed at $(date)" >> ~/.q/commands.log
}