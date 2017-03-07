#!/bin/bash

mkdir -p data
docker run -i -v $PWD/data:/home/deepgreen/persist deepgreen
