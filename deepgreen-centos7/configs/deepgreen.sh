#!/bin/bash

sudo mv /tmp/*deepgreen*.bin /home/deepgreen/ 
printf "\n\n\n" | bash /home/deepgreen/*deepgreen*.bin --accept-license

echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bash_profile
echo 'export GOPATH=/home/deepgreen/persist/go:/home/deepgreen/persist/dgtools/zabbix:/home/deepgreen/persist/dgtools/fsplugin_csv' >> ~/.bash_profile
echo 'export MASTER_DATA_DIRECTORY=/home/deepgreen/persist/db/data0/dg-1' >> ~/.bash_profile
echo 'source /home/deepgreen/deepgreendb/greenplum_path.sh' >> ~/.bash_profile
source ~/.bash_profile

sudo rm ~/*deepgreen*.bin
sudo mv /tmp/cluster.conf ~
sudo mv /tmp/xdrive.toml ~
sudo mv /tmp/run.sh ~
sudo mv /tmp/dgtools.sh ~

sudo mv /tmp/dotfiles.tgz ~
(cd; tar zxf dotfiles.tgz)

sudo mkdir -p /usr/local/dgza
sudo sed -i 's/^Server=.*$/Server=172.20.0.6/g' /etc/zabbix/zabbix_agentd.conf
sudo sed -i 's/^ServerActive=.*$/ServerActive=172.20.0.6/g' /etc/zabbix/zabbix_agentd.conf
sudo sed -i 's/^Hostname=.*$/Hostname=dg/g' /etc/zabbix/zabbix_agentd.conf
