# Prometheus OpenShift Setup

This is an example setup of [Prometheus
Monitoring](https://prometheus.io/) for
[OpenShift](https://www.openshift.com/). it uses Prometheus' [Blackbox
Exporter](https://github.com/prometheus/blackbox_exporter) to monitor
a fictive HTTP Web service, implemented as a basic
[Mountebank](http://www.mbtest.org/) mock.

## Starting and Stopping the Monitored Service

The monitored fictive service can be started and stopped at any
time. These changes are reflected almost instantly on the monitoring
graphs.

To start the service run

```
docker-compose exec mountebank mb start --configfile /etc/mountebank/always-success.json
```
the service will continue to run until you interrupt it, usually by pressing `Ctrl-C`.
