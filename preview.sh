#!/usr/bin/env bash
set -eu

docker run --rm -p 8000:8000 -v $PWD:/docs squidfunk/mkdocs-material:6.1.7