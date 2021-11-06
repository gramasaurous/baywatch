#!/bin/bash

docker rm -f baywatch

docker run --name baywatch \
	   -v /mnt/media2/baywatch/archive/:/var/www/html/archive/ \
	   --restart=always \
	   -d baywatch:latest

