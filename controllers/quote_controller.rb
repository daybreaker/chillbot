class QuoteController < Rubot::Controller
  command :quote do
    reply Quote.random
  end

  command :addquote, :addq do
    msg, author = Quote.parse(message.text)
    Quote.add(msg, author)
  end
end

