require 'sinatra/base'

module Goose
  module Web
    class Server < Sinatra::Base
      get '/' do
        "Hello World"
      end
    end
  end
end
