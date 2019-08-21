#!/usr/bin/env bash
docker build -t emeaccoe/helloworld:production --build-arg BUILD_MODE=production ./ &&\
docker tag emeaccoe/helloworld:production emeaccoe/helloworld:latest