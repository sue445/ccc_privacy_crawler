#!/bin/bash

NAME=$1
MESSAGE=$2

curl https://slack.com/api/chat.postMessage -X POST -d 'channel=#ccc_privacy_crawler' -d "text=${MESSAGE}" -d "username=${NAME}" -d "token=${SLACK_TOKEN}"
