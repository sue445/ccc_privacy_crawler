#!/bin/bash -e

if [ -z "${GITHUB_SHA}" ]; then
  echo "GITHUB_SHA is not set"
  exit 1
fi

sed -i "s!__GITHUB_SHA__!${GITHUB_SHA}!g" app.yaml

grep SENTRY_RELEASE app.yaml
