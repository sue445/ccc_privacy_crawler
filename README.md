# CCC Privacy Crawler

## Requirements
* Ruby 2.1.4

## Setup
```bash
cp config/database.yml{.example,}
vi config/database.yml

bundle install
bundle exec padrino rake ar:create ar:migrate
```

## Run development
```bash
bundle exec padrino start
```

## Test
```bash
RACK_ENV=test bundle exec rake ar:migrate
bundle exec rspec
```
