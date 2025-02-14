#!/bin/bash

if [ -z "$1" ]; then
	VERSION="latest"
else
	VERSION=$1
fi

source .env

set -eux

APP_NAME=$(basename $(pwd))

docker build -t $APP_NAME:$VERSION nginx
