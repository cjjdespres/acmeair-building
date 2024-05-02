#!/bin/bash

# Arguments
ACMEAIR_TAG=""
ACMEAIR_BASE=""

# Other useful parameters
SHOULD_FAIL=""
SCRIPT_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

function displayHelp() {
  echo "Build an Acmeair EE8 image"
  echo ""
  echo "Parameters:"
  echo -n $'\t'; echo "--acmeair-tag=<TAG>"
  echo -n $'\t'; echo "    Tag to use for the resulting acmeair image"
  echo -n $'\t'; echo "    Required."
  echo -n $'\t'; echo "--acmeair-base=<TAG>"
  echo -n $'\t'; echo "    Base Liberty image to use for the resulting acmeair image"
  echo -n $'\t'; echo "    Required"
}

function failWith() {
  echo "Build failed: $1"
  exit 1
}

if [[ $# -eq 0 ]]; then
  displayHelp
  exit 0
fi

for i in "$@"; do
  case $i in
    --acmeair-tag=*)
      ACMEAIR_TAG="${i#*=}"
      shift # past argument=value
      ;;
    --acmeair-base=*)
      ACMEAIR_BASE="${i#*=}"
      shift # past argument=value
      ;;
    -h|--help)
      displayHelp
      exit 0
      ;;
    -*|--*)
      echo "Unknown option $i"
      exit 1
      ;;
    *)
      ;;
  esac
done

if [ -z ${ACMEAIR_TAG} ]; then
  echo "Missing parameter --acmeair-tag=<TAG>"
  SHOULD_FAIL="YES"
fi
if [ -z ${ACMEAIR_BASE} ]; then
  echo "Missing parameter --acmeair-base=<TAG>"
  SHOULD_FAIL="YES"
fi

if [ -n "${SHOULD_FAIL}" ]; then
  failWith "Error(s) when checking build setup. See previous message(s) for details. Run this script without parameters for help."
fi


set -Eeox pipefail

export ACMEAIR_TAG="${ACMEAIR_TAG}"
export ACMEAIR_BASE="${ACMEAIR_BASE}"

cd LibertyContext
./build.sh
