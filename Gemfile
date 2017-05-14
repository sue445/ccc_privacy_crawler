source "https://rubygems.org"

ruby "2.4.1"

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
gem "activerecord", require: "active_record"

# Test requirements
gem "rspec", group: "test"
gem "rack-test", require: "rack/test", group: "test"

# Padrino Stable Gem
gem "padrino", "0.14.0.1" # TODO: Remove version after https://github.com/padrino/padrino-framework/pull/2133 is released

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
gem "sinatra", "< 2.0.0" # FIXME: I think padrino doesn't supports sinatra v2.0.0 yet. https://github.com/sue445/ccc_privacy_crawler/commit/aa15cb8540669d7fa734d9c369eb85a4dcd00ff4
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
