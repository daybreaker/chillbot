class IzController < Rubot::Controller
  command :izify do
    reply "http://www.iseatz.com/izify/#{message.text}.png"
  end
end

