# Greenplum Build on centos7

First setup docker.  To use static IP, we need to create a network.   
We will use
```
docker network create --subnet=172.20.0.0/16 dgnet
```

# Usage
To build, 
```
    bash ./build.sh
```
This will create a docker image. 

To run, 
```
    bash ./start.sh
```

First run will create a ./data dir. Data is persisted in it.  
Later runs will just reuse persisted data. 

Hit ^D to stop the docker process.
