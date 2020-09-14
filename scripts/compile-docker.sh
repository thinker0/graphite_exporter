#!/usr/bin/env bash
set -o nounset
set -o errexit
set -x

export GO111MODULE=on
export GO15VENDOREXPERIMENT=1
export GOPROXY=direct
export GOOS=linux
export GOARCH=amd64
echo =========================================================
env
echo =========================================================

cd /go/src/app

make all
make common-tarball
