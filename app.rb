require 'sinatra'
require './response_builder'

get '/rates' do
  ResponseBuilder.new.deliver
end
