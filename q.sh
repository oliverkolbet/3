#! /bin/bash

q(){
p="\033[95m"
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
elif [ "$namearg" == 'help' ]; then
if [ "$2" == 'list' ]; then
echo -e "$p> q list\033[00m:\nList the visible items in a folder.\nTo list all items including hidden ones, use \"q list all\""
elif [ "$2" == 'download' ]; then
echo -e "$p> q download\033[00m:\n download something from a URL.\nBy default, the item(s) will be downloaded to the current folder you are in.\nTo download to a specific folder, use \"q download [URL] to [LOCATION]\"."
elif [ "$2" == 'go' ]; then
echo -e "$p> q go\033[00m:\n go to a folder.\nUsage: \"q go [LOCATION]\" You can also use go with \"q go up\" to go up one folder level or go back, to go to your previous location."
elif [ "$2" == 'say' ]; then
echo -e "$p> q say\033[00m:\nsay back whatever you typed.\nUsage: \"q say [STUFF]\"\nYou can also say things into files, by using \"q say into [FILE] [STUFF]\"\nwhen saying into files, you can choose \"q say into [FILE] [STUFF]\" or \"q say onto [FILE] [STUFF]\".\nUsing onto will overwrite the file, while using into will add to the file."
elif [ "$2" == 'delete' ]; then
echo -e "$p> q delete\033[00m:\nUse q delete to delete any files or folders you want to get rid of.\nWhen deleting folders, use \"q delete folder [FOLDERS]\". All files will be deleted using either one."
elif [ "$2" == 'help' ]; then
echo -e "Q Help page:"
q help
else
echo -e "$p---Q HELP:---\033[00m\nAll commands are preceded by \"q\".\nType \"q help [COMMAND]\" for help on a command.\nAvailable commands:\nlist, download, go, say, delete, help"
fi
else
echo "qError: Incorrect argument. Use \"q help\" for help."
echo "qError: Incorrect argument" >> ~/.q/commands.log
fi
echo "Command \"$@\" -----  Executed at $(date)" >> ~/.q/commands.log
}
