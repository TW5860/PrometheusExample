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

VOLUME ["/var/lib/grafana", "/var/log/grafana"]

EXPOSE 3000

RUN rm -rf /etc/grafana/provisioning
COPY provisioning /etc/grafana/provisioning
COPY dashboards /etc/grafana/dashboards
RUN chmod -R go+r /etc/grafana

COPY ./run.sh /run.sh

ENV HTTP_PROXY="some-proxy:8080"
ENV NO_PROXY="prometheus"

ENTRYPOINT ["/run.sh"]
