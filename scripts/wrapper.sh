#!/bin/bash

while true
do
	/opt/baywatch/explograb.sh /opt/baywatch/snaps/
	pid=$!
	sleep 20
	kill -SIGKILL $pid
done
