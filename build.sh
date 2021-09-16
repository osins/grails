#!/bin/bash

git pull
docker build -t osins/grails:2.3.8 . && \
docker push
