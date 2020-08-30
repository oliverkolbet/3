#! /bin/bash

q(){
namearg="$1"
args=( "$@" )
unset args[0]
echo ${args[@]}

if "$namearg" == 'list'; then
if "${args[0]}" == 'all'; then
ls -a
else
ls
elif "$namearg" == 'download'; then
if "${args[1]}" == 'to'; then
wget "${args[0]}" -P "${args[2]}"
else
wget "${args[0]}" -P .
elif "$namearg" == 'go'; then
. ~/.q/go.sh ${args[$@]}
fi
}
