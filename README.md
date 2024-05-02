# Building Acmeair EE8-related containers

(Adapted from https://github.com/mpirvu/dockerized-apps/tree/main/AcmeAirEE8, available under the Apache 2.0 licence).

This repo contains some scripts/docker files to build containers necessary to run/benchmark Acmeair EE8 from scratch. Three images can be built:

1. An Acmeair EE8 container based on a particular Liberty image
2. A mongodb container
3. A jmeter 5.3 container for applying load to the Acmeair server

## Usage

After cloning this repo, use `./buildMongoJMeter.sh` to build the mongodb and
JMeter containers. That script takes the following optional parameters:

1. `--jmeter-base=<TAG>`: the base JMeter image to use for building the JMeter container. Default `docker.io/eclipse-temurin:17-jre-focal`.
2. `--jmeter-tag=<TAG>`: the tag to apply to the built JMeter container. Default `jmeter-acmeair:5.3`
3. `--mongo-tag=<TAG>`: the tag to apply to the built mongodb container. Default `mongo-acmeair`.

Then, use `./buildAcmeair.sh` to build the acmeair container. It takes the following required parameters:

1. `--acmeair-tag=<TAG>`: the tag to apply to the resulting acmeair image
2. `--acmeair-base=<TAG>`: the base Liberty image to use when building the acmeair image

## Known issues

- The build script has not been adapted to support checkpointing the acmeair
  image with criu.
