#!/bin/bash -e

set -e

test -z "$1" && TAG=latest || TAG=$1

echo
echo Bulding hippocampe/$TAG
echo

docker build --tag hippocampe/$TAG . &&
  docker tag hippocampe/$TAG sofecta/hippocampe:$TAG &&
  docker push sofecta/hippocampe:$TAG
