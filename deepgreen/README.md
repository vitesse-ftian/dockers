# DeepGreen Docker Image
Used limits.conf and sysctl.conf from github dbbaskette/gpdb-docker.

Tried centos7, which is a PITA to run in docker.  Something wrong with
systemd, d-bus, permission, whatever, who cares.   Centos 6 it is.

# Use 
To build, 
    bash ./build.sh
This will create a docker image with tag deepgreen. 

To run, 
    bash ./startdg.sh
First run it will init a deepgreen with 4 segments.  It will start xdrive as well.
Data is persisted in ./data dir.   Hit ^D to stop the docker process.
Later runs will just start data base, with persisted data.


