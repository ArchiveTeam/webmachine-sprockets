require 'webmachine'
require 'webmachine/adapters/rack'
require 'webmachine/sprockets'

require 'test_server'
Sprockets::Environment

class Assets < Webmachine::Sprockets::Resource
end

class Indexes < Webmachine::Sprockets::Resource
end

class TestServer
  def webmachine_app(env)
    Webmachine::Application.new do |app|
      Assets.sprockets = env
      app.add_route [ 'assets', '*' ], Assets

      Indexes.sprockets = env.index
      app.add_route [ 'cached', 'javascripts', '*' ], Indexes
    end
  end

  def default_app
    Webmachine::Adapters::Rack.new(nil, webmachine_app(@env).dispatcher)
  end
end
