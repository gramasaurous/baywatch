#!/bin/bash

while true
do
	/opt/baywatch/gif.sh /opt/baywatch/snaps/
	pid=$!
	sleep 3600
	kill -SIGKILL $pid
done
