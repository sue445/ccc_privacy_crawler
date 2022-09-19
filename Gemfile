source "https://rubygems.org"

git_source(:github) {|repo| "https://github.com/#{repo}.git" }

# c.f. https://cloud.google.com/appengine/docs/standard/ruby/runtime
ruby "~> 3.0.0"

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
gem "activerecord", ">= 6.1.6.1", "< 7.0.0", require: "active_record" # FIXME: padrino doesn't work with activerecord v7+
gem "sass"
gem "slim"

# Test requirements
gem "rack-test", require: "rack/test", group: "test"
gem "rspec", group: "test"

# Padrino Stable Gem
gem "padrino", ">= 0.15.0"

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.12.4'
# end

gem "activerecord-simple_index_name"
gem "mechanize"
gem "newrelic_rpm"
gem "nokogiri", ">= 1.11.0.rc4"

# FIXME: Use gemified pdf-reader if 2.10.0+ is released
# c.f. https://github.com/yob/pdf-reader/issues/492
# gem "pdf-reader", "> 2.10.0"
gem "pdf-reader", github: "yob/pdf-reader", ref: "aacc768"

gem "puma"
gem "rollbar"
gem "twitter"
gem "webrick" # TOOD: Remove this after https://github.com/sparklemotion/mechanize/pull/556 is merged

group :development do
  gem "annotate"
  gem "dotenv", group: :test
  gem "foreman"
  gem "onkcop", ">= 1.0.0.0", require: false
  gem "pry-byebug", group: :test
  gem "rubocop_auto_corrector", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rake", require: false
  gem "rubocop-rspec", ">= 2.0.0.pre", require: false
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
  gem "pg", ">= 1.0.0", group: :test
end
