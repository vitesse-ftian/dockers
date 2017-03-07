#!/bin/bash

sudo mv /tmp/deepgreen*.bin /home/deepgreen/ 
printf "\n\n\n" | bash /home/deepgreen/deepgreen*.bin --accept-license

echo 'export MASTER_DATA_DIRECTORY=/home/deepgreen/persist/db/data0/dg-1' >> ~/.bash_profile
echo 'source /home/deepgreen/deepgreendb/greenplum_path.sh' >> ~/.bash_profile
source ~/.bash_profile
sudo rm ~/deepgreen*.bin

sudo mv /tmp/cluster.conf ~
sudo mv /tmp/xdrive.toml ~
sudo mv /tmp/run.sh ~
