FROM centos:6
MAINTAINER Feng Tian <ftian@vitessedata.com>

COPY * /tmp/
RUN echo root:deepGr33n | chpasswd \
        && yum install -y unzip which tar more git vim sudo util-linux-ng passwd openssh-clients openssh-server \
        && rpm -ivh http://repo.zabbix.com/zabbix/3.2/rhel/6/x86_64/zabbix-release-3.2-1.el6.noarch.rpm \
        && yum install --nogpgcheck -y zabbix zabbix-agent zabbix-sender \
        && yum clean all \
        && service sshd start \
        && bash /tmp/root.sh \
        && su deepgreen -l -c "bash /tmp/deepgreen.sh" 

EXPOSE 5432 22

CMD service sshd start \ 
    && su deepgreen -l -c "bash /home/deepgreen/run.sh" \
    && /bin/bash
