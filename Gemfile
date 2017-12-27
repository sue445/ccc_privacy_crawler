source "https://rubygems.org"

ruby "2.5.0"

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
gem "activerecord", require: "active_record"
gem "sass"
gem "slim"

# Test requirements
gem "rack-test", require: "rack/test", group: "test"
gem "rspec", group: "test"

# Padrino Stable Gem
gem "padrino"

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
  gem "onkcop", require: false
  gem "pry-byebug", group: :test
  gem "sqlite3", group: :test
end

group :test do
  gem "coveralls", require: false
  gem "database_rewinder"
  gem "factory_bot"
  gem "rspec-its"
  gem "rspec-temp_dir"
end

group :production do
  gem "pg", group: :test
end
