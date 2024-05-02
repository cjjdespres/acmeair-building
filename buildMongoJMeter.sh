#!/bin/bash

# Arguments (unlikely to change very often)
JMETER_BASE="docker.io/eclipse-temurin:17-jre-focal"
JMETER_TAG="jmeter-acmeair:5.3"
MONGO_TAG="mongo-acmeair"

set -Eeox pipefail

export JMETER_BASE="${JMETER_BASE}"
export JMETER_TAG="${JMETER_TAG}"
export MONGO_TAG="${MONGO_TAG}"

cd ./JMeterContext
./build.sh

cd ../MongoContext
./build.sh
