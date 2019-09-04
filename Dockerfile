###################################################
# Lightweight Hippocampe container
###################################################

# Build the base from J8 Alpine
FROM openjdk:8-jre-alpine

RUN apk add --update --no-cache python \
    python-dev \
    py-pip \
    git \
    curl \
    nodejs \
    nodejs-npm

#	elasticsearch==5.5.3 \
#	elasticsearch=~6 \

RUN npm install -g bower
RUN pip install --upgrade pip && \
    pip install apscheduler \
	Configparser \
        elasticsearch6>=6.4.2 \
	flask \
	python-dateutil \
	requests \
	urllib3==1.23

COPY ./core /opt/Hippocampe/core
COPY docker-entrypoint.sh /

RUN adduser hippo -D
RUN chown -R hippo:hippo /opt/Hippocampe /docker-entrypoint.sh

USER hippo

RUN cd /opt/Hippocampe/core/static && bower install

EXPOSE 5000

ENTRYPOINT /docker-entrypoint.sh
