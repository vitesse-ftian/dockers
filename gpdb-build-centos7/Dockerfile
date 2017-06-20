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
