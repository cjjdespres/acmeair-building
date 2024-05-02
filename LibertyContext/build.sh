#!/bin/bash

# Arguments:
#   ACMEAIR_TAG: tag to use for the resulting container
#   ACMEAIR_BASE: image to use as the base for the acmeair image
docker build \
  --no-cache \
  -m=512m \
  -f Dockerfile_acmeair \
  -t "${ACMEAIR_TAG}" \
  --build-arg="ACMEAIR_BASE=${ACMEAIR_BASE}" \
  .
