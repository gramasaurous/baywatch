#!/bin/bash

docker run --name baywatch \
	   -p 8008:80 \
	   --restart=always \
	   -d baywatch:latest

