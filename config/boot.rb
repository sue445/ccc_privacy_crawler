# Defines our constants
RACK_ENV = ENV['RACK_ENV'] ||= 'development'  unless defined?(RACK_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

module Padrino
  IGNORE_NO_RENDERING_ENGINE = true
end

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, RACK_ENV)

##
# ## Enable devel logging
#
# Padrino::Logger::Config[:development][:log_level]  = :devel
# Padrino::Logger::Config[:development][:log_static] = true
#
# ## Configure your I18n
#
# I18n.default_locale = :en
# I18n.enforce_available_locales = false
#
# ## Configure your HTML5 data helpers
#
# Padrino::Helpers::TagHelpers::DATA_ATTRIBUTES.push(:dialog)
# text_field :foo, :dialog => true
# Generates: <input type="text" data-dialog="true" name="foo" />
#
# ## Add helpers to mailer
#
# Mail::Message.class_eval do
#   include Padrino::Helpers::NumberHelpers
#   include Padrino::Helpers::TranslationHelpers
# end

I18n.default_locale = :ja

Padrino::Logger::Config[:production][:stream] = :stdout
Padrino::Logger::Config[:production][:log_level]  = :info
Padrino::Logger::Config[:test][:stream] = :stdout
Padrino::Logger::Config[:test][:log_level]  = :info

##
# Add your before (RE)load hooks here
#
Padrino.before_load do
  Dotenv.load unless Padrino.env == :production
  Time.zone = "Tokyo"
end

##
# Add your after (RE)load hooks here
#
Padrino.after_load do
end

Padrino.load!
