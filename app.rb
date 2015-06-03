require 'sinatra'
require './response_builder'

get '/' do
  content_type :json
  ResponseBuilder.new.deliver
end
