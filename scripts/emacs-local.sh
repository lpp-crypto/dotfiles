#!/usr/bin/sh

dir=$(echo "get_variable dir" | nc -U /tmp/etabli.sock -N)
if [ ! $dir ]; then
    dir="~"
fi

server=$(echo "get_variable emacs-server" | nc -U /tmp/etabli.sock -N)
if [ $server ]; then
    if [ $# -ge 1 ]; then
        emacsclient -socket-name="$server" -c $@
    else
        emacsclient -socket-name="$server" -c "$dir" 
    fi
else
    level=$(echo "current_level" | nc -U /tmp/etabli.sock -N)
    notify-send "starting emacs server $level" -t 3000
    emacs --daemon="$level"
    echo "set_variable emacs-server $level" | nc -U /tmp/etabli.sock -N
    emacsclient -socket-name=$level -c
fi
