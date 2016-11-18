#!/bin/bash

cd /opt/bfdcloud/kafkaice/bin
# start registry
/bin/bash registry_start.sh
sleep 3
# start node
nohup ${ICE_HOME}/bin/icegridnode --Ice.Config=`pwd`/../etc/node.cfg &
sleep 3
# start application
cd /opt/bfdcloud/kafkaice/bin
${ICE_HOME}/bin/icegridadmin --Ice.Config=`pwd`/../etc/admin.cfg -u admin -p beijing -e "application add ../etc/pApplication08.xml" -e "application add ../etc/cApplication08.xml"
while true
do
    sleep 100000
done
