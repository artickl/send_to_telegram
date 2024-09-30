#!/bin/bash

## INSTALL
## sudo cp login-notify.sh /etc/profile.d/login-notify.sh
    
login_ip="$(echo $SSH_CONNECTION | cut -d " " -f 1)"
login_date="$(date +"%F %T")"
login_name="$(whoami)"

# For new line I use $'\n' here
message="$login_date [INFO] User $login_name logged in from $login_ip"

#send it to telegram
send_to_telegram.sh "$message"
