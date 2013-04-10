class TwitterUtil
  require 'twitter'
  def self.tweet(status_id)
    if status = Twitter.status(status_id)
      CGI.unescapeHTML "\x02@#{status.user.screen_name}\x02: \x16#{status.text}\x16"
    end
  end
end
