#!/bin/sh
set -e

CMD="$@"

if [[ ${CMD:0:4} = "http" ]]; then
  GIT_SRC=$1
  CMD="i18ndude"
fi

if [[ ${CMD:0:3} = "git" ]]; then
  GIT_SRC=$1
  CMD="i18ndude"
fi

if [ ! -z "$GIT_SRC" ]; then
  cd /code
  git clone $GIT_SRC
fi

if [[ ${CMD:0:1} = "-" ]]; then
  exec i18ndude "$@"
fi

if [ "$CMD" = "i18ndude" ]; then
  i18ndude find-untranslated /code
else
  exec "$@"
fi
