class QuoteController < Rubot::Controller
  command :quote do
    reply Quote.random
  end

  command :addquote, :addq do
    msg, author = Quote.parse(message.text)
    if Quote.add(msg, author)
      reply "quote added: #{msg[1, 10]}..."
    end
  end
end

