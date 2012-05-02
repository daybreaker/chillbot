class WebController < Rubot::Controller
  command :calc do
    reply Google.calc(:q => message.text)
  end

  command :google, :g do
    reply Google.lmgtfy_url_for(message.text)
  end

  listener :matches => %r{http://[^\s]+} do
    reply WebUtil.title(matches)
  end
end