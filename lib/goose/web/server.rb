require 'bundler/setup'
Bundler.require(:web)

module Goose
  module Web
    class Server < Sinatra::Base
      set :haml, format: :html5

      get '/' do
        haml :index
      end
    end
  end
end
