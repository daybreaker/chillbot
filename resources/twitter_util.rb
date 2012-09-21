class TwitterUtil
  require 'twitter'
  def self.tweet(status_id)
    if status = Twitter.status(status_id)
      "\u0002@#{status.user.screen_name}: \u0002\u0016#{status.text}"
    end
  end
end
