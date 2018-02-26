FROM centos:7

USER root

ARG EXPORTER_VERSION=0.11.0

RUN set -ex; \ 
    curl -o /tmp/exporter.tar.gz -L "https://github.com/prometheus/blackbox_exporter/releases/download/v${EXPORTER_VERSION}/blackbox_exporter-${EXPORTER_VERSION}.linux-amd64.tar.gz"; \
    tar xfz /tmp/exporter.tar.gz -C /tmp; \
    rm /tmp/exporter.tar.gz; \
    mkdir -p /etc/blackbox_exporter; \
    mv /tmp/blackbox_exporter-${EXPORTER_VERSION}.linux-amd64/blackbox_exporter /bin/blackbox_exporter; \
    mv /tmp/blackbox_exporter-${EXPORTER_VERSION}.linux-amd64/blackbox.yml /etc/blackbox_exporter/config.yml; \
    rm -r /tmp/blackbox_exporter-${EXPORTER_VERSION}.linux-amd64

COPY blackbox-exporter.yml /etc/prometheus/blackbox-exporter.yml

USER nobody
EXPOSE 9115
CMD [ "/bin/blackbox_exporter", \
      "--config.file=/etc/blackbox_exporter/config.yml" ]
