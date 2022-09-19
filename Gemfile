source "https://rubygems.org"

git_source(:github) {|repo| "https://github.com/#{repo}.git" }

# c.f. https://cloud.google.com/appengine/docs/standard/ruby/runtime
ruby "~> 3.0.0"

gem "padrino", ">= 0.15.0"

gem "activerecord", ">= 6.1.6.1", "< 7.0.0", require: "active_record" # FIXME: padrino doesn't work with activerecord v7+
gem "activerecord-simple_index_name"
gem "mechanize"
gem "nokogiri", ">= 1.11.0.rc4"

# FIXME: Use gemified pdf-reader if 2.10.0+ is released
# c.f. https://github.com/yob/pdf-reader/issues/492
# gem "pdf-reader", "> 2.10.0"
gem "pdf-reader", github: "yob/pdf-reader", ref: "aacc768"

gem "pg", ">= 1.0.0"
gem "puma", require: false
gem "sass"
gem "sentry-ruby"
gem "slim"
gem "twitter"

group :development do
  gem "annotate"
  gem "dotenv", group: :test
  gem "foreman"
  gem "onkcop", ">= 1.0.0.0", require: false
  gem "rake"
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
  gem "rack-test", require: "rack/test"
  gem "rspec"
  gem "rspec-its"
  gem "rspec-temp_dir"
end

group :production do
  gem "appengine"

  # c.f. https://github.com/GoogleCloudPlatform/serverless-exec-ruby/pull/20
  gem "google-serverless-exec", github: "sue445/serverless-exec-ruby", branch: "ruby_3.0"
end
