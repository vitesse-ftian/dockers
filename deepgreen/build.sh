#!/bin/bash

FILE=deepgreendb.16.15.rh6.x86_64.170221.bin
if [ -f $FILE ]; then
    echo "Using already downloaded $FILE."
else 
    echo "Download $FILE."
    curl -O http://storage.googleapis.com/vitessedata/download/$FILE
fi

docker build -t deepgreen .
