#!/bin/bash

cat /tmp/sysctl.conf.add >> /etc/sysctl.conf \
    && cat /tmp/limits.conf.add >> /etc/security/limits.conf \
    && rm -f /tmp/*.add \
    && /usr/sbin/groupadd deepgreen \
    && /usr/sbin/useradd deepgreen -g deepgreen -G wheel \
    && echo deepgreen:deepGr33n | chpasswd \
    && echo "deepgreen    ALL=(ALL)    NOPASSWD: ALL" >> /etc/sudoers \

