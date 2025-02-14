#!/bin/bash

if [ -z "$1" ]; then
	VERSION="latest"
else
	VERSION=$1
fi

source .env

ENV=( "OAUTH2_REDIRECT_URL" "OAUTH2_CLIENT_ID" "OAUTH2_CLIENT_SECRET" "OAUTH2_COOKIE_SECRET" )

set -u

for VAR in "${ENV[@]}"; do
  : ${!VAR?"Error: $VAR is not set"}
done

set -eux

APP_NAME=$(basename $(pwd))

docker run --rm --name $APP_NAME \
	-p 80:80 \
	-e OAUTH2_REDIRECT_URL=$OAUTH2_REDIRECT_URL \
	-e OAUTH2_CLIENT_ID=$OAUTH2_CLIENT_ID \
	-e OAUTH2_CLIENT_SECRET=$OAUTH2_CLIENT_SECRET \
	-e OAUTH2_COOKIE_SECRET=$OAUTH2_COOKIE_SECRET \
	$APP_NAME:$VERSION
