#!/bin/sh
kill -KILL `cat tmp/unicorn.pid`
if [ $? -eq 0 ]; then
	echo "Stop unicorn successfully"
else
	echo "Stop unicorn failed"
fi
unicorn -c ./config/unicorn.rb ./config/config.ru -D
if [ $? -eq 0 ]; then
	echo "Start unicorn successfully"
else
	echo "Start unicorn failed"
fi
