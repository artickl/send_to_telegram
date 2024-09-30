#!/bin/bash

######################
#
# create config in one of the locations:
#    ~/.send_to_telegram.conf
#    $HOME/.send_to_telegram.conf
#    /etc/send_to_telegram.conf
#
# add 2 variables GROUP_ID and BOT_TOKEN 
#
# copy script to one of the $PATH locations like:
#    /usr/bin/send_to_telegram.sh (for system wise usage)
#    ~/.local/bin (for personal usage)
#
######################

GROUP_ID=""
BOT_TOKEN=""

#LOOKING FOR A CONFIG
if test -f ~/.send_to_telegram.conf ; then
  source ~/.send_to_telegram.conf
elif test -f $HOME/.send_to_telegram.conf ; then
  source $HOME/.send_to_telegram.conf
elif test -f /etc/send_to_telegram.conf ; then
  source /etc/send_to_telegram.conf
fi

if [ -z "$GROUP_ID" ]; then
  echo "GROUP_ID is required" >&2
  exit 0
fi

if [ -z "$BOT_TOKEN" ]; then
  echo "BOT_TOKEN is reqired" >&2
  exit 0
fi

## checking if some information arrived via stdin
declare -a Arguments=("$@")
[[ -p /dev/stdin ]] && { mapfile -t -O ${#Arguments[@]} Arguments; set -- "${Arguments[@]}"; }

if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` \"message to sent\"" >&2
  exit 0
fi

if [ -z "$1" ]; then
    echo "Please add message" >&2
    exit 0
fi

if [ "$#" -ne 1 ]; then
    echo "Too many arguments, should be only one" >&2
    exit 0
fi

curl -s --data "text=$1" --data "chat_id=$GROUP_ID" 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' > /dev/null