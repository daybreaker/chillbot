begin
  # Try to require the preresolved locked set of gems.
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fall back on doing an unlocked resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end

require "yaml"
require "rubot"

config = YAML.load_file 'resources/config.yml'

config["server"].delete("vhost") if ARGV[0] == "dev"

dispatcher = Rubot::Core::Dispatcher.new(config)
server = Rubot::Irc::Server.new(dispatcher)
server.connect