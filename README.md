# CCC Privacy Crawler
[![wercker status](https://app.wercker.com/status/91dcba24a5f721c86e17cd46bdae30aa/m "wercker status")](https://app.wercker.com/project/bykey/91dcba24a5f721c86e17cd46bdae30aa)

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
