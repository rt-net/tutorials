#!/usr/bin/env bash
set -eu

# This script is based on https://gist.github.com/Tiryoh/41bccca5ef7f954ffed9f1829dc2dcc6
# released under the MIT License
# (C) 2021 Daisuke Sato

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); cd ../; pwd)


# there is no Negative Lookahead in sed
# https
find $SRC_DIR/docs -name "*.md" | xargs sed -i -e 's#\([^\!]\)\[\(.*\)\](\(https://.*\))\([^\{]\)#\1[\2](\3){target=_blank rel=noopener}\4#g'
find $SRC_DIR/docs -name "*.md" | xargs sed -i -e 's#\([^\!]\)\[\(.*\)\](\(https://.*\))$#\1[\2](\3){target=_blank rel=noopener}#g'
find $SRC_DIR/docs -name "*.md" | xargs sed -i -e 's#^\[\(.*\)\](\(https://.*\))\([^\{]\)#[\1](\2){target=_blank rel=noopener}\3#g'
# http
find $SRC_DIR/docs -name "*.md" | xargs sed -i -e 's#\([^\!]\)\[\(.*\)\](\(http://.*\))\([^\{]\)#\1[\2](\3){target=_blank rel=noopener}\4#g'
find $SRC_DIR/docs -name "*.md" | xargs sed -i -e 's#\([^\!]\)\[\(.*\)\](\(http://.*\))$#\1[\2](\3){target=_blank rel=noopener}#g'
find $SRC_DIR/docs -name "*.md" | xargs sed -i -e 's#^\[\(.*\)\](\(http://.*\))\([^\{]\)#[\1](\2){target=_blank rel=noopener}\3#g'