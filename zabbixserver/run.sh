#!/bin/bash

echo "Starting zabbix database ..."

docker run --net dgnet --ip 172.20.0.5 \
    -d --name zabbix-db \
    --env="MARIADB_USER=zabbix" --env="MARIADB_PASS=zzaabbix" \
    monitoringartist/zabbix-db-mariadb

sleep 2
echo "Starting zabbix server ..."

docker run --net dgnet --ip 172.20.0.6 \
    -d --name zabbix \
    -p 10080:80 -p 10551:10551 \
    -v /etc/localtime:/etc/localtime:ro \
    --link zabbix-db:zabbix.db \
    --env="ZS_DBHost=zabbix.db" \
    --env="ZS_DBUser=zabbix" \
    --env="ZS_DBPassword=zzaabbix" \
    --env="XXL_zapix=true" \
    --env="XXL_grapher=true" \
    monitoringartist/zabbix-xxl:latest


