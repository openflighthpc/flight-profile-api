# frozen_string_literal: true

require 'sinatra'

require_relative 'lib/profile_api'

configure do
  set :bind, '0.0.0.0'
  set :dump_errors, false
  set :raise_errors, true
  set :show_exceptions, false
end

before do
  content_type 'application/json'
end

namespace '/ping' do
  get do
    content_type 'text/plain'
    status 200
    'OK'
  end
end

post '/remove' do
  status 204
  ProfileAPI::ProfileCLI.remove_node(
    params['node'],
    remove_hunter_node: params['remove_hunter_node']
  )
  'OK'
end
