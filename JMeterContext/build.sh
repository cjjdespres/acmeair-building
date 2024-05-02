#!/bin/bash

# Arguments:
#   JMETER_TAG: Tag for the resulting JMeter image
#   JMETER_BASE: Base JDK image for the JMeter image

docker build \
       -f Dockerfile_jmeter \
       -t "${JMETER_TAG}" \
       --build-arg="JMETER_BASE=${JMETER_BASE}" \
       .
