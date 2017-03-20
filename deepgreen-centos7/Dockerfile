FROM centos:7
MAINTAINER Feng Tian <ftian@vitessedata.com>

#
# Centos 7 Docker.  Compared to Centos 6, note that we installed
# net-tools (ifconfig), iproute (ip), and the way to config/start
# sshd are quite different.
#
# Also installed "Development Tools" because this docker is intended
# for internal dev use.
#

COPY * /tmp/
RUN echo root:deepGr33n | chpasswd \
        && yum install -y unzip which tar more git vim sudo util-linux-ng passwd openssh-clients openssh-server \
        && yum install -y net-tools iproute \
        && yum groupinstall -y "Development Tools" \
        && rpm -ivh http://repo.zabbix.com/zabbix/3.2/rhel/7/x86_64/zabbix-release-3.2-1.el7.noarch.rpm \
        && yum install --nogpgcheck -y zabbix zabbix-agent zabbix-sender \
        && yum clean all \
        && mkdir /var/run/sshd \
        && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' \
        && /usr/sbin/sshd \
        && bash /tmp/root.sh \
        && su deepgreen -l -c "bash /tmp/deepgreen.sh" 

EXPOSE 5432 22

CMD /usr/sbin/sshd \ 
    && su deepgreen -l -c "bash /home/deepgreen/run.sh" \
    && /bin/bash
