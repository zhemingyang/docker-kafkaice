#!/bin/bash

cd /opt/bfdcloud/kafkaice/bin
/bin/bash registry_start.sh
${ICE_HOME}/bin/icegridnode --Ice.Config=`pwd`/../etc/node.cfg 2>&1 | tee -a `pwd`/../log/node_start.log
