#!/bin/bash

echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bash_profile
echo 'export GOPATH=/home/deepgreen/go:/home/deepgreen/p/go' >> ~/.bash_profile
source ~/.bash_profile

sudo mv /tmp/run.sh ~
