class RandController < Rubot::Controller
  command :rand do
    reply message.text.split(",").sample.strip
  end
end