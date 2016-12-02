source "https://rubygems.org"

ruby "2.3.3"

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem "rake"

# Component requirements
gem "slim"
gem "sass"
gem "activerecord", ">= 3.1", require: "active_record"

# Test requirements
gem "rspec", group: "test"
gem "rack-test", require: "rack/test", group: "test"

# Padrino Stable Gem
gem "padrino", "0.13.1"

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.12.4'
# end

gem "activerecord-simple_index_name"
gem "mechanize"
gem "newrelic_rpm"
gem "pdf-reader"
gem "puma"
gem "rollbar"
gem "twitter"

group :development do
  gem "annotate"
  gem "dotenv", group: :test
  gem "foreman"
  gem "rubocop", "0.36.0"
  gem "pry", group: :test
  gem "pry-nav", group: :test
  gem "sqlite3", group: :test
end

group :test do
  gem "coveralls", require: false
  gem "database_rewinder"
  gem "factory_girl"
  gem "rspec-its"
  gem "rspec-temp_dir"
end

group :production do
  gem "pg", group: :test
end
