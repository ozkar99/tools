#!/bin/bash

IMAGE_NAME="${DOCKER_NAME}:${TRAVIS_COMMIT}"
IMAGE_LATEST="${DOCKER_NAME}:latest"

# push to docker repository
docker login -u "$DOCKER_USERNAME"  -p "$DOCKER_PASSWORD"
docker build -t "$IMAGE_NAME" .
docker push "$IMAGE_NAME"

# also update latest tag
docker tag "$IMAGE_NAME" "$IMAGE_LATEST"
docker push "$IMAGE_LATEST"

# send post to webhook here too notify server to pull latest image
curl -u deploy:$WEBHOOK_PASSWORD -X POST http://$WEBHOOK_SERVER/deploy?ref=$TRAVIS_COMMIT
