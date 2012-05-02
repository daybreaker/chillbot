class FactController < Rubot::Controller
  command :fact do
    reply "GO FUCK YOURSELF #{message.from.upcase}"
  end
end