#!/bin/bash

docker rm -f bwapp

docker run --name bwapp \
	-p 8008:8008 \
	-v /mnt/media2/baywatch/archive:/app/static/archive \
	--restart=always \
	-d bwapp:latest
