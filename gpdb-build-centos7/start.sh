#!/bin/bash

mkdir -p data
docker run --hostname=gpdb7 --net=dgnet --ip=172.20.0.27 -i -v $PWD/data:/home/deepgreen/p gpdb-build-centos7
