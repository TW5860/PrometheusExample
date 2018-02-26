FROM centos:7

USER root

#ARG GRAFANA_VERSION=4.6.3-1
ARG GRAFANA_VERSION=5.0.0-beta4
ARG DOWNLOAD_URL="https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-${GRAFANA_VERSION}.x86_64.rpm"

RUN yum install -y initscripts fontconfig urw-fonts

RUN set -ex; \
    curl ${DOWNLOAD_URL} > /tmp/grafana.deb; \
    rpm -Uvh /tmp/grafana.deb; \
    rm /tmp/grafana.deb

RUN curl -L https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64 > /usr/sbin/gosu
RUN chmod +x /usr/sbin/gosu

VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]

EXPOSE 3000

COPY ./run.sh /run.sh

ENTRYPOINT ["/run.sh"]
