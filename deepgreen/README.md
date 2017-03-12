# DeepGreen Docker Image
Used limits.conf and sysctl.conf from github dbbaskette/gpdb-docker.

Tried centos7, which is a PITA to run in docker.  Something wrong with
systemd, d-bus, permission, whatever, who cares.   Centos 6 it is.

To use static IP, we need to create a network.   We will use
```
docker network create --subnet=172.20.0.0/16 dgnet
```

# Use 
To build, 
```
    bash ./build.sh
```
This will create a docker image with tag deepgreen. 

To run, 
```
    bash ./startdg.sh
```
First run will init a deepgreen with 4 segments.  It will start xdrive as well.
Data is persisted in ./data dir.   Hit ^D to stop the docker process.
Later runs will just start data base, with persisted data.

# Zabbix
Use dgtools.sh to pull dgtools from github.  The script should build/install
Zabbix agent software.   

We do not start it because not all people use this container cares.  
dgza developer need to start this manually, or, update the run.sh 
script.
```
sudo /etc/init.d/zabbix-agent [re]start
```
