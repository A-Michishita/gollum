#!/bin/sh
unicorn -c ./config/unicorn.rb ./config/config.ru -D
if [ $? -eq 0 ]; then
	echo "Start unicorn successfully"
else
	echo "Start unicorn failed"
fi
