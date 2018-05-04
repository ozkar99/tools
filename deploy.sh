#!/bin/bash

IMAGE_NAME="${DOCKER_NAME}:${TRAVIS_COMMIT}"

# push to docker repository
docker login -u "$DOCKER_USERNAME"  -p "$DOCKER_PASSWORD"
docker build -t "$IMAGE_NAME" .
docker tag "$IMAGE_NAME" "${DOCKER_NAME}:latest"
docker push "$IMAGE_NAME"

# send post to webhook here too notify server to pull latest image
curl -u deploy:$WEBHOOK_PASSWORD -X POST http://$WEBHOOK_SERVER/deploy?ref=$TRAVIS_COMMIT
