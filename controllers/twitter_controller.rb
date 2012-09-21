class TwitterController < Rubot::Controller
  listener :matches => %r{http(s?)://twitter\.com\/(\w+)\/status?\/(\d+)$} do
    reply TwitterUtil.tweet(matches[3])
  end
end
