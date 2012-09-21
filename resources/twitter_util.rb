class TwitterUtil
  require 'twitter'
  def self.tweet(status_id)
    if status = Twitter.status(status_id)
      "\u0002@#{status.user.screen_name}: \u0002\u201C\u0016#{status.text}\u201D"
    end
  end
end
