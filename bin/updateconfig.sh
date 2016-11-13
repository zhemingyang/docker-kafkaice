#!/bin/bash 
HOST_IP=`/sbin/ifconfig | sed -n '/inet addr/'p | grep Bcast | awk -F ":" '{print $2}' | awk '{print $1}'`
echo ${HOST_IP}
echo ${KAFKA_BROKER_ADDR}
echo ${KAFKA_ICE_HOME}
echo ${KAFKA_ZK_ADDR}
sed -i "s/KAFKA_BROKER_ADDR/${KAFKA_BROKER_ADDR}/g" ${KAFKA_ICE_HOME}/etc/producerconfig.xml
sed -i "s/KAFKA_ZK_ADDR/${KAFKA_ZK_ADDR}/g" ${KAFKA_ICE_HOME}/etc/consumerconfig.xml
sed -i "s/REGISTRY_IP/${HOST_IP}/g" ${KAFKA_ICE_HOME}/etc/admin.cfg
sed -i -e "s/LOCALHOST/${HOST_IP}/g" -e "s/REGISTRY_IP/${HOST_IP}/g" ${KAFKA_ICE_HOME}/etc/node.cfg
sed -i -e "s/LOCALHOST/${HOST_IP}/g" ${KAFKA_ICE_HOME}/etc/registry.cfg
sed -i "s/REGISTRY_IP/${HOST_IP}/g" ${KAFKA_ICE_HOME}/test/producer_test.py
sed -i "s/REGISTRY_IP/${HOST_IP}/g" ${KAFKA_ICE_HOME}/test/consumer_test.py
