#!/bin/bash

# push to docker repository
docker login -u "$DOCKER_USERNAME"  -p "$DOCKER_PASSWORD"
docker build -t ozkar99/tools .
docker push ozkar99/tools

# send post to webhook here too notify server to pull latest image
# curl -X POST 