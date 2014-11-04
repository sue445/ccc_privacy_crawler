source 'https://rubygems.org'

ruby '2.1.4'

gem 'padrino', '0.12.4'

gem 'activerecord', '>= 3.1', require: 'active_record'
gem 'mechanize'
gem 'pdf-reader'
gem 'rake'
gem 'sidekiq'
gem 'sidekiq-cron'
gem 'slim'
gem 'twitter'

group :development do
  gem 'annotate'
  gem 'dotenv' , group: :test
  gem 'pry'    , group: :test
  gem 'pry-nav', group: :test
  gem 'sqlite3', group: :test
end

group :test do
  gem 'database_rewinder'
  gem 'factory_girl'
  gem 'rspec'
  gem 'rspec-its'
  gem 'rspec-temp_dir'
  gem 'rack-test', require: 'rack/test'
end

group :production do
  gem 'pg'
end
