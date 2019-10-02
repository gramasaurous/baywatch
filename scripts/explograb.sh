#!/bin/bash

CAM_URL="http://qt.exploratorium.edu/roofcam/Observatory/image.jpg"

FOLDER=$1

if [ "${FOLDER}" == "" ]; then
	echo "Error: need a folder"
	exit 1
fi

mkdir -p ${FOLDER}/rejects

DIRTY=true

while [ ${DIRTY} == true ]
do
	IMAGE=$(date -u +%s).jpg
	curl --silent ${CAM_URL} -o ${FOLDER}/tmp.jpg

	if xxd -ps ${FOLDER}/tmp.jpg | tail -n 2 | grep -q ffd9; then
		#echo "clean!"
		DIRTY=false
		convert ${FOLDER}/tmp.jpg -resize 30% ${FOLDER}/tmp_small.jpg 
		mv ${FOLDER}/tmp_small.jpg ${FOLDER}/${IMAGE}
	else
		#echo "dirty!"
		mv ${FOLDER}/tmp.jpg ${FOLDER}/rejects/${IMAGE}
	fi
	echo -n "."
	sleep 1
done
echo ""


