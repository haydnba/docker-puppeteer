#!/usr/bin/env bash

set e+x

# Build and tag the image
docker build -t ${BUILD_NAME} .
docker tag ${BUILD_NAME} ${PROFILE_NAME}/${BUILD_NAME}:latest

# Login to the docker hub
cat .env.pw | docker login --username ${PROFILE_NAME} --password-stdin

# Publish the image
docker push ${PROFILE_NAME}/${BUILD_NAME}:latest
