class IzController < Rubot::Controller
  command :izify do
    reply "http://corpweb-dev.iseatz.com/izify/#{message.text}.png"
  end
end

