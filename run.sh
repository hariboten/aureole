#!/bin/bash

if [ -z "$1" ]; then
	VERSION="latest"
else
	VERSION=$1
fi

source .env

set -eux

APP_NAME=$(basename $(pwd))

docker run --rm --name $APP_NAME -p 80:80 $APP_NAME:$VERSION
