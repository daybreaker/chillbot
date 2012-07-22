class QuoteController < Rubot::Controller
  command :quote do
    reply Quote.random
  end

  command :addquote, :addq do
    message, author = Quote.parse(message.text)
    Quote.add(message, author)
  end
end

