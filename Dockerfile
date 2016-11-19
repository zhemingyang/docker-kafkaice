# VERSION 0.0.1

FROM docker.baifendian.com/xiaohu.nie/centos5.8-base:latest
MAINTAINER zheming.yang <zheming.yang@baifendian.com>

RUN yum -y install vim-enhanced.x86_64

# make su function well
RUN /bin/sed -i '11c session         optional        system-auth' /etc/pam.d/su

# 创建一个独立用户，不能用root直接启动服务
RUN /usr/sbin/useradd -d /opt/bfdcloud -m bfdcloud -p bfd@123
RUN mkdir -p /opt/bfdcloud/kafkaice
ENV KAFKA_ICE_HOME=/opt/bfdcloud/kafkaice
COPY . $KAFKA_ICE_HOME
RUN chown -R bfdcloud:bfdcloud /opt/bfdcloud
CMD ["/opt/bfdcloud/kafkaice/bin/all_start.sh"]
