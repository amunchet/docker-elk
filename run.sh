#!/bin/sh

# File to run
docker-compose -f docker-compose.yml -f extensions/logspout/logspout-compose.yml -f extensions/apm-server/apm-server-compose.yml up --build 