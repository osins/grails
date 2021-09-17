#!/bin/bash

tagname="osins/grails:2.3.8"

git pull
docker build -t $tagname . && \
docker push $tagname
