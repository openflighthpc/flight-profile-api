# frozen_string_literal: true

require_relative 'config/boot'
require_relative 'app'

require 'sinatra'

app = Rack::Builder.new do
  run Sinatra::Application
end

run app
