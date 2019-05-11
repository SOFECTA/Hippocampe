#!/bin/bash -e

set -e

#docker build . && \
docker-compose build && \
	docker tag hippocampe_hippocampe:latest sofecta/hippocampe:latest
	docker push sofecta/hippocampe:latest
