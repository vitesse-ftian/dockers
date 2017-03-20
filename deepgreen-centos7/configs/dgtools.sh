#!/bin/bash

cd ~/persist
mkdir -p ~/persist/go

if [ -f ./dgtools/README.md ]; then
    echo "dgtools exists."
else 
    git clone https://github.com/vitesse-ftian/dgtools.git 
fi

# Build dgza
cd dgtools/zabbix
make
sudo make install
sudo cp /usr/local/dgza/userparameter_dgza.conf /etc/zabbix/zabbix_agentd.d/

# We will not build fsplugin_csv for now.
