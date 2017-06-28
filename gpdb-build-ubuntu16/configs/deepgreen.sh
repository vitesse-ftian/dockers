#!/bin/bash

echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/deepgreen/.bash_profile
echo 'export GOPATH=/home/deepgreen/go:/home/deepgreen/p/go' >> /home/deepgreen/.bash_profile
source /home/deepgreen/.bash_profile

sudo mv /tmp/run.sh /home/deepgreen
