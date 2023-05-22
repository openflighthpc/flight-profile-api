ENV['RACK_ENV'] ||= 'development'
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'rubygems'
require 'bundler'

if ENV['RACK_ENV'] == 'development'
  Bundler.require(:default, :development)
else
  Bundler.require(:default)
end

require 'dotenv'

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'profile_api'
