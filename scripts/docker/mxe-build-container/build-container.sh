#!/bin/bash
set -x
set -e

# known good MXE sha
MXE_SHA="0d21cf2e31d4e6c0"
SCRIPTPATH=$(dirname $0)

# version of the docker image
VERSION=3.0.1

pushd $SCRIPTPATH

# we use the 'experimental' --squash argument to significantly reduce the size of the massively huge
# Docker container this produces
docker build -t subsurface/mxe-build-container:$VERSION --build-arg=mxe_sha=$MXE_SHA -f Dockerfile .
docker images
popd
