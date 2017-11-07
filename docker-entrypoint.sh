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
  if [ ! -z "$GIT_NAME" ]; then
     if [ -z "$GIT_BRANCH" ]; then
       GIT_BRANCH="master"
     fi
     cd $GIT_NAME
     if [ ! -z "$GIT_CHANGE_ID" ]; then
        git fetch origin pull/$GIT_CHANGE_ID/head:$GIT_BRANCH
     fi
     git checkout $GIT_BRANCH
     cd /code
  fi
fi

if [ -z "$FILES" ]; then
  FILES="/code"
  if [ ! -z "$EXCLUDE" ]; then
    FIND="find /code -type f -name *pt"
    for path in $EXCLUDE; do
      FIND="$FIND ! -path *$path*"
    done
    FILES="$($FIND)"
  fi
fi

if [[ ${CMD:0:1} = "-" ]]; then
  exec i18ndude find-untranslated "$@" $FILES
fi

if [ "$CMD" = "i18ndude" ]; then
  i18ndude find-untranslated $PARAMS $FILES
else
  exec "$@"
fi
