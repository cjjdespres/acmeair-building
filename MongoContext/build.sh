#!/bin/bash

# Arguments:
#   MONGO_TAG: Tag for the resulting mongodb image

docker build -f Dockerfile_mongo -t "${MONGO_TAG}" .
