module WebSupport
  require 'rack/test'
  require 'goose/web/server'

  include Rack::Test::Methods

  def app
    Goose::Web::Server
  end
end
