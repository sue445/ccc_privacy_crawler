#!/bin/bash -xe

source ./appengine/secrets.sh

./appengine/gcp-get-secret bundle exec $*
