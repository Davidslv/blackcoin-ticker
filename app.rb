require 'sinatra'
require './response_builder'

get '/rates' do
  content_type :json
  ResponseBuilder.new.deliver
end
