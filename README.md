# CCC Privacy Crawler
Tカードの [個人情報提供の停止 対象企業一覧](http://qa.tsite.jp/faq/show/25129) の新着を通知するためのTwitterボットです

* Twitter: https://twitter.com/ccc_privacy_bot
* Twilog: http://twilog.org/ccc_privacy_bot
* webアプリ: https://ccc-privacy-crawler.herokuapp.com/

[![Circle CI](https://circleci.com/gh/sue445/ccc_privacy_crawler/tree/master.png?style=badge)](https://circleci.com/gh/sue445/ccc_privacy_crawler/tree/master)
[![Dependency Status](https://gemnasium.com/sue445/ccc_privacy_crawler.svg)](https://gemnasium.com/sue445/ccc_privacy_crawler)
[![Code Climate](https://codeclimate.com/github/sue445/ccc_privacy_crawler/badges/gpa.svg)](https://codeclimate.com/github/sue445/ccc_privacy_crawler)
[![Coverage Status](https://img.shields.io/coveralls/sue445/ccc_privacy_crawler.svg)](https://coveralls.io/r/sue445/ccc_privacy_crawler)

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/sue445/ccc_privacy_crawler/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

## Requirements
* Ruby 2.3.0

## Setup
* create twitter app and generate access token
  * https://apps.twitter.com/

```bash
cp .env{.example,}
vi .env

bundle install
bundle exec padrino rake ar:create ar:migrate
```

## Run development
run local server

```bash
bundle exec padrino s
open http://localhost:3000/
```

run crawler

```bash
bundle exec rake crawl_pdf
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
heroku config:set NEWRELIC_LICENSE_KEY=xxxxxxxxxxxxxxxxxx
```

## Heroku deploy
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

register `rake crawl_pdf` to [Heroku Scheduler](https://addons.heroku.com/scheduler)

![Heroku Scheduler](img/heroku_scheduler.png)
