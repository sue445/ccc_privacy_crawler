# CCC Privacy Crawler
[![Circle CI](https://circleci.com/gh/sue445/ccc_privacy_crawler/tree/master.png?style=badge)](https://circleci.com/gh/sue445/ccc_privacy_crawler/tree/master)
[![Dependency Status](https://gemnasium.com/sue445/ccc_privacy_crawler.svg)](https://gemnasium.com/sue445/ccc_privacy_crawler)

## Requirements
* Ruby 2.1.4

## Setup
* create twitter app and generate access token
  * https://apps.twitter.com/

```bash
cp config/database.yml{.example,}
vi config/database.yml
cp .env{.example,}
vi .env

bundle install
bundle exec padrino rake ar:create ar:migrate
```

## Run development
```bash
bundle exec padrino r "PdfCrawlWorker.new.perform"
```

## Test
```bash
RACK_ENV=test bundle exec rake ar:migrate
bundle exec rspec
```

## Setup Heroku
```bash
heroku config:set TWITTER_CONSUMER_KEY=xxxxxxxxxxxxxxxxxx
heroku config:set TWITTER_CONSUMER_SECRET=xxxxxxxxxxxxxxxxxx
heroku config:set TWITTER_ACCESS_TOKEN=xxxxxxxxxxxxxxxxxx
heroku config:set TWITTER_ACCESS_TOKEN_SECRET=xxxxxxxxxxxxxxxxxx
heroku config:set REDIS_PROVIDER=REDISTOGO_URL
```
