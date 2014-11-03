source 'https://rubygems.org'

ruby '2.1.4'

gem 'padrino', '0.12.4'

gem 'activerecord', '>= 3.1', require: 'active_record'
gem 'pdf-reader'
gem 'rake'
gem 'slim'

group :development do
  gem 'annotate'
  gem 'sqlite3', group: :test
end

group :test do
  gem 'factory_girl'
  gem 'rspec'
  gem 'rspec-its'
  gem 'rack-test', require: 'rack/test'
end

group :production do
  gem 'pg'
end
