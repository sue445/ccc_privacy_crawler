#!/bin/bash -xe

bundle install --jobs=4 --retry=3 --path vendor/bundle
bundle clean

# Resolve bundler version difference between Gemfile.lock and pre-installed in CI
gem install restore_bundled_with --no-document
restore-bundled-with
