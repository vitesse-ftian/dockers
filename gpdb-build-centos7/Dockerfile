FROM centos:7
MAINTAINER Feng Tian <ftian@vitessedata.com>

#
# A working docker for build gpdb.
#

COPY * /tmp/
RUN echo root:deepGr33n | chpasswd \
        && yum install -y unzip which tar more git vim sudo util-linux-ng passwd openssh-clients openssh-server \
        && yum install -y net-tools iproute tmux \
        && yum install -y ncurses ncurses-devel \
        && yum groupinstall -y "Development Tools" \
        && yum install -y epel-release \
        && yum install -y openssl openssl-libs openssl-devel \
        && yum install -y readline readline-devel apr-devel \
        && yum install -y bzip2 bzip2-devel \
        && yum install -y libevent libevent-devel \
        && yum install -y libcurl libcurl-devel \
        && yum install -y libxml2 libxml2-devel \
        && yum install -y python-devel \
        && yum install -y python-pip \
        && yum clean all \
        && pip install --upgrade pip \
        && pip install setuptools \
        && pip install psutil \
        && pip install lockfile \
        && pip install paramiko \
        && mkdir /var/run/sshd \
        && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' \
        && /usr/sbin/sshd \
        && bash /tmp/root.sh \
        && su deepgreen -l -c "bash /tmp/deepgreen.sh" 

EXPOSE 5432 22

CMD /usr/sbin/sshd \ 
    && su deepgreen -l -c "bash /home/deepgreen/run.sh" \
    && /bin/bash
