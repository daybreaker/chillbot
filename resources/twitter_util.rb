class TwitterUtil
  require 'twitter'
  def self.tweet(status_id)
    if status = Twitter.status(status_id)
      "'#{status.text}' - @#{status.user.screen_name}"
    end
  end
end
