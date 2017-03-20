# DeepGreen Docker Image
Used limits.conf and sysctl.conf from github dbbaskette/gpdb-docker.

Centos 7, with Dev Tools installed (gcc, make).

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

# TPCH 
Use dgtools.sh to pull dgtools from github.  cd to ~/persist/dgtools/tpch
bash ./data.sh
make tpch1f

