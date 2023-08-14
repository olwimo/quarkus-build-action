#!/bin/sh

set -e

OUTPUT_NAME=$1
DOCKERFILE_PATH=$2

if [ -z "$OUTPUT_NAME" ]; then
  echo '<outputName> parameter is missing'
  exit 1
fi

if [ -f "$DOCKERFILE_PATH" ] ; then
  echo "Dockerfile found"
else
  echo "Imposible to find Dockerfile at path: $DOCKERFILE_PATH"
  exit 1
fi

docker build . -f "$DOCKER_PATH" -t builder-image

RUNNER_NAME="$(docker run builder-image ls /usr/src/app/target | grep .-runner)"
ID="$(docker create builder-image)"

docker cp "$ID:/usr/src/app/target/$RUNNER_NAME" "$OUTPUT_NAME"
