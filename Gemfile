source 'https://rubygems.org'

gem 'activerecord', '>= 3.1', require: 'active_record'
gem 'padrino', '0.12.4'
gem 'rake'
gem 'slim'

group :development do
  gem 'sqlite3', group: :test
end

group :test do
  gem 'rspec'
  gem 'rack-test', require: 'rack/test'
end

group :production do
  gem 'pg'
end
