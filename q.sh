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
elif [ "$namearg" == 'say' ]; then
if [ "$2" == 'into' ]; then
unset args[1]
unset args[2]
echo -e "${args[@]}" >> "$3"
elif [ "$2" == 'onto' ]; then
unset args[1]
unset args[2]
echo -e "${args[@]}" > "$3"
else
echo -e "${args[@]}"
fi
elif [ "$namearg" == 'delete' ]; then
if [ "$2" == 'folder' ]; then
unset args[1]
rm -r "${args[@]}"
else
rm "${args[@]}" || echo -e "There is probably a folder in the things you are trying to delete.\nUse \"q delete folder [FOLDER]\". The other items are already deleted."
fi
else
echo "qError: Incorrect argument"
echo "qError: Incorrect argument" >> ~/.q/commands.log
exit
fi
echo "Command \"$@\" -----  Executed at $(date)" >> ~/.q/commands.log
}