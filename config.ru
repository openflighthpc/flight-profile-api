# frozen_string_literal: true

require_relative 'config/boot'
require_relative 'app'

require 'sinatra'

configure do
  LOGGER = ProfileAPI.logger
  use Rack::CommonLogger, LOGGER

  enable :logging, :dump_errors
  set :raise_errors, true
end

app = Rack::Builder.new do
  run Sinatra::Application
end

run app
