#!/bin/sh
kill -KILL `cat /Users/Akito/.Gollum/tmp/unicorn.pid`
if [ $? -eq 0 ]; then
	echo "Stop unicorn successfully"
else
	echo "Stop unicorn failed"
fi
