#!/bin/bash

mkdir -p data
docker run --hostname=dg7 --net=dgnet --ip=172.20.0.17 -i -v $PWD/data:/home/deepgreen/persist deepgreen-centos7
