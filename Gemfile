source 'https://rubygems.org'

ruby '2.3.0'

gem 'padrino', '0.12.5'

gem 'activerecord', '~> 4.2.1', require: 'active_record'
gem 'activerecord-simple_index_name'
gem 'mechanize'
gem 'newrelic_rpm'
gem 'pdf-reader'
gem 'rake'
gem 'rollbar'
gem 'twitter'

group :development do
  gem 'annotate'
  gem 'dotenv' , group: :test
  gem 'foreman'
  gem 'pry'    , group: :test
  gem 'pry-nav', group: :test
  gem 'sqlite3', group: :test
end

group :test do
  gem 'coveralls', require: false
  gem 'database_rewinder'
  gem 'factory_girl'
  gem 'rspec'
  gem 'rspec-its'
  gem 'rspec-temp_dir'
  gem 'rack-test', require: 'rack/test'
end

group :production do
  gem 'pg', group: :test
end
