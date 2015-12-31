FROM debian:jessie
MAINTAINER Yanlong <yanlong_he@163.com>

# Install packages
RUN apt-get update && \
    apt-get -y install openssh-server pwgen vim wget gcc libxml2 libxml2-dev libssl-dev libcurl4-openssl-dev pkg-config make && \
    mkdir -p /var/run/sshd && \
    sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
    sed -i "s/PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config

ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
ADD build_php.sh /build_php.sh
RUN /build_php.sh
RUN chmod +x /*.sh

ENV AUTHORIZED_KEYS **None**

VOLUME  ["/app"]

EXPOSE 22
CMD ["/run.sh"]
