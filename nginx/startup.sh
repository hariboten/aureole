#!/bin/bash

ENV=( "OAUTH2_REDIRECT_URL" "OAUTH2_CLIENT_ID" "OAUTH2_CLIENT_SECRET" "OAUTH2_COOKIE_SECRET" )

set -u

for VAR in "${ENV[@]}"; do
  : ${!VAR?"Error: $VAR is not set"}
done

envsubst < /etc/oauth2proxy.cfg.template > /etc/oauth2proxy.cfg
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
