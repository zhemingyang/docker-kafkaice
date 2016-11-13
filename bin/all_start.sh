#!/bin/bash
/bin/bash ${KAFKA_ICE_HOME}/bin/updateconfig.sh
# 用bfdcloud用户启动ice相关服务
su - bfdcloud -c "/bin/bash ${KAFKA_ICE_HOME}/bin/ice_start.sh"
