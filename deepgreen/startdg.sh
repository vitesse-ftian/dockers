#!/bin/bash

mkdir -p data
docker run --hostname=dg --net=dgnet --ip=172.20.0.10 -i -v $PWD/data:/home/deepgreen/persist deepgreen
