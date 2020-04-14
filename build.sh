#!/bin/bash -e

set -e

test -z "$1" && TAG=latest || TAG=$1

echo
echo Bulding hippocampe/$TAG
echo
#exit 1

#docker build . && \
#docker-compose build && \
#	docker tag hippocampe_hippocampe:latest sofecta/hippocampe:latest
#	docker push sofecta/hippocampe:latest

docker build --tag hippocampe/$TAG . &&
  docker tag hippocampe/$TAG sofecta/hippocampe:$TAG &&
  docker push sofecta/hippocampe:$TAG
