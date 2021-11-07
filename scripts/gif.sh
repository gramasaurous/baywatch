#!/bin/bash


FOLDER=$1

if [ "${FOLDER}" == "" ]; then
	echo "Error: need a folder"
	exit 1
fi

pushd ${FOLDER}

WORKDIR=$(mktemp -d)

mkdir -p ${WORKDIR}/rejects/
mkdir -p /var/www/html/archive/rejects

mv *.jpg ${WORKDIR}
mv rejects/*.jpg ${WORKDIR}/rejects/

pushd ${WORKDIR}

rm tmp.jpg
rm clean.mp4
rm reject.mp4

ffmpeg -f image2 -pattern_type glob -i '*.jpg' -pix_fmt yuv420p -vcodec libx264 clean.mp4
ffmpeg -f image2 -pattern_type glob -i 'rejects/*.jpg' -pix_fmt yuv420p -vcodec libx264 reject.mp4

TIMESTAMP=$(date +"%y-%m-%dT%H:%M")

mv reject.mp4 /var/www/html/archive/rejects/${TIMESTAMP}.mp4
mv clean.mp4 /var/www/html/archive/${TIMESTAMP}.mp4
cp /var/www/html/archive/${TIMESTAMP}.mp4 /var/www/html/archive/latest.mp4

