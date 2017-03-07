FROM centos:6.7
MAINTAINER Feng Tian <ftian@vitessedata.com>

COPY * /tmp/
RUN echo root:deepGr33n | chpasswd \
        && yum install -y unzip which tar more sudo util-linux-ng passwd openssh-clients openssh-server; yum clean all \
        && service sshd start \
        && bash /tmp/root.sh \
        && su deepgreen -l -c "bash /tmp/deepgreen.sh" 

EXPOSE 5432 22 6688

CMD service sshd start \ 
    && su deepgreen -l -c "bash /home/deepgreen/run.sh" \
    && /bin/bash
