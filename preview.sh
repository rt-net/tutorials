#!/usr/bin/env bash
set -eu

docker run --rm -p 8000:8000 -v $PWD:/docs tiryoh/mkdocs-builder:alpine