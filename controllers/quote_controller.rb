class QuoteController < Rubot::Controller
  command :quote do
    reply Quote.random
  end

  command :addquote, :addq do
    msg, author = Quote.parse(message.text)
    reply "parsing #{message.text}"
    reply "message = #{msg[1, 25]}"
    reply "author = #{author}"
    Quote.add(msg, author)
  end
end

