#!/bin/sh

gunicorn --chdir /app bwapp:app -w 2 --threads 2 -b 0.0.0.0:5000
