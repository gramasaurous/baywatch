#!/bin/sh

SCRIPT_NAME=/baywatch gunicorn --chdir /app baywatch:app -w 2 --threads 2 -b 0.0.0.0:8008 --access-logfile -
