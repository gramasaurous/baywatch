#!/bin/bash


FOLDER=$1

if [ "${FOLDER}" == "" ]; then
	echo "Error: need a folder"
	exit 1
fi

pushd ${FOLDER}

WORKDIR=$(mktemp -d)

mv *.jpg ${WORKDIR}

pushd ${WORKDIR}

rm tmp.jpg

cat *.jpg | ffmpeg -f image2pipe -vcodec mjpeg -i - latest.mp4

mv latest.mp4 /var/www/html/latest.mp4


