#!/bin/bash
nohup ${ICE_HOME}/bin/icegridnode --Ice.Config=`pwd`/../etc/node.cfg 2>&1 > `pwd`/../log/node_start.log &
