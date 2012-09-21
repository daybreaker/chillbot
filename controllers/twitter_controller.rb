class TwitterController < Rubot::Controller
  listener :matches => %r{http(s?)://(.*)twitter\.com\/(\w+)\/status(es)*\/(\d+)} do
    reply TwitterUtil.tweet(matches[5])
  end
end
