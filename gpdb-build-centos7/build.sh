#!/bin/bash


function download {
if [ -f $2 ]; then
    echo "Using already downloaded $2." 
else 
    echo "Download $2." 
    curl -O $1/$2 
fi
}

GO=go1.8.linux-amd64.tar.gz

download https://storage.googleapis.com/golang $GO

docker build --no-cache=true -t gpdb-build-centos7 . 
