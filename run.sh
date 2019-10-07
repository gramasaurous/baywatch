#!/bin/bash

docker rm -f baywatch

docker run --name baywatch \
	   -v /opt/mediaserver/baywatch/archive/:/var/www/html/archive/ \
	   -p 8008:80 \
	   --restart=always \
	   -d baywatch:latest

