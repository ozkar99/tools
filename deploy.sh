#!/bin/bash

IMAGE_NAME="${DOCKER_NAME}:${TRAVIS_COMMIT}"

# push to docker repository
docker login -u "$DOCKER_USERNAME"  -p "$DOCKER_PASSWORD"
docker build -t "$IMAGE_NAME" .
docker push "$IMAGE_NAME"

# send post to webhook here too notify server to pull latest image
# curl -X POST 