#!/bin/bash -ex

: "${GF_PATHS_CONFIG:=/etc/grafana/grafana.ini}"
: "${GF_PATHS_DATA:=/var/lib/grafana}"
: "${GF_PATHS_LOGS:=/var/log/grafana}"
: "${GF_PATHS_PLUGINS:=/var/lib/grafana/plugins}"
: "${GF_PATHS_PROVISIONING:=/etc/grafana/provisioning}"

if [ ! -z "${GF_INSTALL_PLUGINS}" ]; then
  OLDIFS=$IFS
  IFS=','
  for plugin in ${GF_INSTALL_PLUGINS}; do
    IFS=$OLDIFS
    grafana-cli --pluginsDir "${GF_PATHS_PLUGINS}" plugins install ${plugin}
  done
fi

exec /usr/sbin/grafana-server \
  --homepath=/usr/share/grafana \
  --config="$GF_PATHS_CONFIG" \
  cfg:default.log.mode="console" \
  cfg:default.paths.data="$GF_PATHS_DATA" \
  cfg:default.paths.logs="$GF_PATHS_LOGS" \
  cfg:default.paths.plugins="$GF_PATHS_PLUGINS" \
  cfg:default.paths.provisioning=$GF_PATHS_PROVISIONING \
  "$@"
