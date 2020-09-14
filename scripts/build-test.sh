#!/usr/bin/env bash

rm -rf target
mkdir -p target

./scripts/build-docker.sh

docker run \
    -it \
    --rm \
    -v ${GOPATH:-${HOME}/go}/pkg:/go/pkg:rw \
    -v $(pwd):/go/src/app:rw \
    --workdir /go/src/app \
    -t graphite_exporter-compiler:latest \
    /go/src/app/scripts/compile-docker.sh
