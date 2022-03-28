#!/usr/bin/env bash

set e+x

# Pull the image
docker pull ${PROFILE_NAME}/${BUILD_NAME}

# Run with custom seccomp profile
docker run -it --rm --ipc=host --security-opt seccomp=$(PWD)/seccomp_profile.json ${BUILD_NAME}
