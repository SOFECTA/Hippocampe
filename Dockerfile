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

# Elasticsearch 7.x
#elasticsearch>=7.0.0,<8.0.0

# Elasticsearch 6.x
#elasticsearch>=6.0.0,<7.0.0

# Elasticsearch 5.x
#elasticsearch>=5.0.0,<6.0.0

#Werkzeug 0.16.0 

RUN npm install -g bower
RUN pip install --upgrade pip && \
    pip install apscheduler && \
    pip install	configparser && \
    pip install elasticsearch>="7.0.0,<8.0.0" && \
    pip install flask && \
    pip install python-dateutil && \
    pip install requests && \
    pip install urllib3 && \
    pip install werkzeug=="0.16.0"

	#elasticsearch==5.5.3 \
	#urllib3==1.23

COPY ./core /opt/Hippocampe/core
COPY docker-entrypoint.sh /

RUN adduser hippo -D
RUN chown -R hippo:hippo /opt/Hippocampe /docker-entrypoint.sh

USER hippo

RUN cd /opt/Hippocampe/core/static && bower install

EXPOSE 5000

ENTRYPOINT /docker-entrypoint.sh
