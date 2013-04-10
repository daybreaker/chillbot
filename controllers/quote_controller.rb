class QuoteController < Rubot::Controller
  command :quote do
    if term = message.text.strip and !term.empty?
      reply Quote.search(term)
    else
      reply Quote.random
    end
  end

  command :addquote, :addq do
    msg, author = Quote.parse(message.text)
    if Quote.add(msg, author)
      reply "quote added: #{msg[0, 10]}..."
    end
  end
end

