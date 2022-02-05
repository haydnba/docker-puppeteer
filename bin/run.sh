#!/usr/bin/env bash

set e+x

# Pull the image
docker pull ${PROFILE_NAME}/${BUILD_NAME}

# Run with `sys_admin` capability
docker run --cap-add=SYS_ADMIN ${BUILD_NAME}
