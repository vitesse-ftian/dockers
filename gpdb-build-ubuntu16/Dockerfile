FROM ubuntu:16.04
MAINTAINER Feng Tian <ftian@vitessedata.com>

#
# A working docker for build gpdb.
#

COPY * /tmp/
RUN echo root:deepGr33n | chpasswd 
RUN apt-get update
RUN apt-get install -y git vim tmux openssh-client openssh-server sudo
RUN apt-get install -y flex bison autoconf libtool bzip2
RUN apt-get install -y libyaml-dev libreadline-dev zlib1g-dev libssl-dev
RUN apt-get install -y python-dev libpython-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y python-pip
RUN pip install --upgrade pip
RUN pip install setuptools
RUN pip install psutil
RUN pip install lockfile
RUN pip install paramiko
RUN mkdir /var/run/sshd
RUN /usr/sbin/sshd
RUN bash /tmp/root.sh
RUN su deepgreen -l -c "bash /tmp/deepgreen.sh" 

EXPOSE 5432 22

CMD /usr/sbin/sshd \ 
    && su deepgreen -l -c "bash /home/deepgreen/run.sh" \
    && /bin/bash
