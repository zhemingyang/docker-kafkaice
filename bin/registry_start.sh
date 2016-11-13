#!/bin/bash
nohup ${ICE_HOME}/bin/icegridregistry --Ice.Config=`pwd`/../etc/registry.cfg 2>&1 > `pwd`/../log/registry_start.log &
