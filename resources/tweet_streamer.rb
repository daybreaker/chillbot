require "yaml"
require "yajl"
require "tweetstream"
require "singleton"

class TweetStreamer
  
  include Singleton

  def initialize

    # lol : (
    config_yaml = YAML.load_file "twitter.yml"
    
    TweetStream.configure do |config|
      config.consumer_key       = config_yaml["consumer_key"]
      config.consumer_secret    = config_yaml["consumer_secret"]
      config.oauth_token        = config_yaml["oauth_token"]
      config.oauth_token_secret = config_yaml["oauth_token_secret"]
      config.auth_method        = :oauth
      config.parser = :yajl
    end

    Twitter.configure do |config|
      config.consumer_key       = config_yaml["consumer_key"]
      config.consumer_secret    = config_yaml["consumer_secret"]
      config.oauth_token        = config_yaml["oauth_token"]
      config.oauth_token_secret = config_yaml["oauth_token_secret"]
    end
    
    @client = TweetStream::Client.new    
  end

  def start(&callback)
    if block_given?          
      stop
      ids = Tweeple.twitter_ids
      @client.filter(:follow => ids) do |status|
        callback.call(status)
      end
    end
  end

  def stop
    @client.stop_stream
  end

  def get_user(name)
    Twitter.user(name)
  end

end
