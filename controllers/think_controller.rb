class ThinkController < Rubot::Controller
  command :think do
    reply "Thinking about #{message.text}, is it worth the effort?"
  end
end
