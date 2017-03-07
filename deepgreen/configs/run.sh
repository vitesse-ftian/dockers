#!/bin/bash

cd /home/deepgreen

#
# See github kevinmtrowbridge/greenplumdb_singlenode_docker
#
# Docker Hack: Docker will set up random hostnames and when gpinitsystem 
# runs, the hostname will be recorded/used.  Later when docker stop/restart
# it will get a different hostname but the gpstart will fail with mysterious
# error 
#   [Errno -2] Name or service not known 
#
# The way to fix is record hostname at gpinitsystem time -- in the *persist*
# store, then patch /etc/hosts at run time.   Note that patch /etc/hosts when
# gpinitsystem won't work, because a docker restart will lose what ever info
# we write.
#
# NOTE: Trouble continues, gpssh does not the map hack -- need to gpssh-exkeys
# again, otherwise, gpstart, xdrive will fail.
#

if [ -f ./persist/db/hostfile ]; then
    mapfile < /home/deepgreen/persist/hostname_at_gpinit
    echo "127.0.0.1 ${MAPFILE[@]}" | sudo tee -a /etc/hosts

	gpssh-exkeys -f ./persist/db/hostfile
	echo "Start deepgreen database ..."
	gpstart -a
	echo "Start xdrive ..."
	xdrctl start ~/xdrive.toml
else 
	sudo chown deepgreen ~/cluster.conf
	chmod 755 ~/cluster.conf
	sudo chown deepgreen /home/deepgreen/persist
    hostname > /home/deepgreen/persist/hostname_at_gpinit

	echo "Init deepgreen database ..."
	mkdir -p /home/deepgreen/persist/db
	cd /home/deepgreen/persist/db 
	echo localhost > ./hostfile
	gpssh-exkeys -f ./hostfile
	mkdir -p data{0,1,2,3,4}
	gpinitsystem -a -c ~/cluster.conf --lc-collate=C
	echo "host all all 0.0.0.0/0 md5" >> $MASTER_DATA_DIRECTORY/pg_hba.conf
	createdb deepgreen
    dg setup -all template1
    dg setup -all deepgreen
	psql -d template1 -c "alter user deepgreen password 'deepGr33n'"
	gpstop -a -M fast
	gpstart -a

	echo "Init XDrive ..."
	xdrctl deploy ~/xdrive.toml
	mkdir -p /home/deepgreen/persist/xdrive/data
	xdrctl start ~/xdrive.toml 
fi

echo "Deepgeen Started.   Enjoy!" 
