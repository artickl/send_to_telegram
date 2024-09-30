# send_to_telegram
Bash collection of scripts to sent messages to telegram

## PRE INSTALL

Go to BotFather: https://web.telegram.org/a/#93372553 and create new BOT:
```
> /newbot
> new_bot_name
> new_bot_username
< new bot URL (t.me/new_bot_username)
< API Key
```
Remember API key - it will be your $BOT_TOKEN

Go to your bot url and sent ```/start```.
Go to https://api.telegram.org/bot$BOT_TOKEN/getUpdates, there copy chat_id - this will be our GROUP_ID

## INSTALL

```
$ git clone git@github.com:artickl/send_to_telegram.git
$ cd send_to_telegram
$ sudo ln -s $(pwd)/send_to_telegram.sh /usr/bin/send_to_telegram.sh
$ which send_to_telegram.sh 
/usr/bin/send_to_telegram.sh 
```

## SETUP
2 ways to setup:
1. store credentials in script
2. store credentials in user config file

First option - just modify 3rd and 4th line in send_to_telegram
Second option - create the following file:
```
$ vim ~/.send_to_telegram.conf
BOT_TOKEN=your bot tocket
GROUP_ID=your group id
```

## TEST
```
$ send_to_telegram.sh "My first test message"
```
