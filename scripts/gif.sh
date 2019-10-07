#!/bin/bash


FOLDER=$1

if [ "${FOLDER}" == "" ]; then
	echo "Error: need a folder"
	exit 1
fi

pushd ${FOLDER}

WORKDIR=$(mktemp -d)

mkdir -p ${WORKDIR}/rejects/

mv *.jpg ${WORKDIR}
mv rejects/*.jpg ${WORKDIR}/rejects/

pushd ${WORKDIR}

rm tmp.jpg

cat *.jpg | ffmpeg -f image2pipe -vcodec mjpeg -i - clean.mp4
cat rejects/*.jpg | ffmpeg -f image2pipe -vcodec mjpeg -i - reject.mp4

TIMESTAMP=$(date +"%y-%m-%dT%H:%M")

mv rejects.mp4 /var/www/html/archive/rejects/${TIMESTAMP}.mp4
mv clean.mp4 /var/www/html/archive/${TIMESTAMP}.mp4
cp /var/www/html/achive/${TIMESTAMP}.mp4 /var/www/html/latest.mp4


