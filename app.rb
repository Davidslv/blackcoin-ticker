require 'sinatra'
require './response_builder'

class BlackcoinTickerApp < Sinatra::Base
  set :protection, :except => [:json_csrf]

  def initialize(*args)
    super
  end

  get '/' do
    content_type :json
    ResponseBuilder.new.deliver
  end
end
