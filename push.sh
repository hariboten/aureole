#!/bin/bash

if [ -z "$1" ]; then
	VERSION="latest"
else
	VERSION=$1
fi

source .env

if [ -z "$CONTAINER_REGISTRY" ]; then
	echo "Please set CONTAINER_REGISTRY in .env file"
	exit 1
fi

set -eux

APP_NAME=$(basename $(pwd))

docker login $CONTAINER_REGISTRY

docker tag $APP_NAME $CONTAINER_REGISTRY/$APP_NAME:$VERSION

docker push $CONTAINER_REGISTRY/$APP_NAME:$VERSION
