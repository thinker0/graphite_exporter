#!/usr/bin/env bash
# set -o nounset
# set -o errexit

cmd=$1

if [[ "x$cmd" = "xclean" ]]; then
    docker rmi -f graphite_exporter-compiler
fi

if [[ "x$cmd" = "xcleanup" ]]; then
    echo Cleanup All docker
    docker stop $(docker ps -a -q)
    docker rm -f $(docker ps -a -q)
    docker rmi $(docker images -q)
    docker system prune --all --force
fi

docker build -t graphite_exporter-compiler -f ./scripts/Dockerfile.dist.centos7 .