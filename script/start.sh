#!/bin/sh
DIR="/Users/Akito"
GOLLUM="$DIR/.Gollum"
UNICORN="$DIR/.rbenv/versions/2.2.2/bin/unicorn"
$UNICORN -c $GOLLUM/config/unicorn.rb $GOLLUM/config/config.ru -D
if [ $? -eq 0 ]; then
	echo "Start unicorn successfully"
else
	echo "Start unicorn failed"
fi
