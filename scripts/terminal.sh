#!/usr/bin/sh

kitty $(echo "get_variable dir" | nc -U /tmp/etabli.sock -N)
