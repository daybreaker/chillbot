require 'set'
require 'yajl'
require 'tweetstream'

class TweetStreamController < Rubot::Controller

  command :tweetstream do
    case
    when message.text.match(/^following/)
      reply "Following " + Tweeple.screen_names.join(', ')
    when follow = message.text.sub!(/^follow/, '')
      if user = TweetStreamer.instance.get_user(follow)
        Tweeple.find_or_create(:twitter_id => user.id, :screen_name => user.screen_name)
        reply "Following #{Tweeple.screen_names.join(', ')}"
      else
        reply "User #{follow} not found."
      end
    when message.text.match(/^remove_all/)
      Tweeple.dataset.delete
      reply "REMOVED ALL FOLLOWBROS"
    when remove = message.text.sub!(/^remove/, '')
      if user = TweetStreamer.instance.get_user(remove)
        Tweeple[user.id].destroy
        reply "Removed #{remove.strip}."
      end
    when message.text.match(/^start/)
      TweetStreamer.instance.start do |message|
        reply "\u0002@#{message.user.screen_name}: \u0002\u0016#{message.text}"
      end
      reply "Tweeter Starting..."
    when message.text.match(/^stop/)
      TweetStreamer.instance.stop
      reply "Tweeter Stopping..."
    end
  end  
end
