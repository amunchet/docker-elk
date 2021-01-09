#!/bin/sh

# File to run

echo "Starting dockers..."
docker-compose -f docker-compose.yml -f extensions/logspout/logspout-compose.yml -f extensions/apm-server/apm-server-compose.yml up --build -d 

echo "Installing sentinl..."

# This doesn't work with cygwin - run manually
docker exec docker-elk_kibana_1 "/opt/kibana/bin/kibana-plugin /opt/kibana/bin/kibana-plugin install https://github.com/sirensolutions/sentinl/releases/download/tag-6.2.2/sentinl-v6.2.2.zip"

echo "Restarting kibana..."
docker restart docker-elk_kibana_1