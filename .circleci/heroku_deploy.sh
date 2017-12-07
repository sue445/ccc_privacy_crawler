#!/bin/bash -xe

heroku config:add BUNDLE_WITHOUT="test:development" --app $HEROKU_APP_NAME

git push git@heroku.com:$HEROKU_APP_NAME.git $CIRCLE_SHA1:refs/heads/master

heroku run rake ar:migrate --app $HEROKU_APP_NAME
