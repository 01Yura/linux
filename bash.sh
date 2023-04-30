#!/bin/bush
echo Привет Федор

name="черт проклятый"
x=2
y=3

# echo 'Привет $name' одинарные кавычки не работают

echo "Привет $name"

z=$(($x+$y))
echo $z

# Переменные окружения
#root@291417:~# env
#SHELL=/bin/bash
#HISTTIMEFORMAT=%h %d %H:%M:%S
#PWD=/root
#LOGNAME=root
#XDG_SESSION_TYPE=tty
#HOME=/root
#LANG=en_US.UTF-8
#SSH_CONNECTION=88.241.51.147 35902 194.87.199.75 22
#XDG_SESSION_CLASS=user
#TERM=xterm
#USER=root
#SHLVL=1
#XDG_SESSION_ID=266
#XDG_RUNTIME_DIR=/run/user/0
#SSH_CLIENT=88.241.51.147 35902 22
#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/0/bus
#MAIL=/var/mail/root
#SSH_TTY=/dev/pts/0
#_=/usr/bin/env
