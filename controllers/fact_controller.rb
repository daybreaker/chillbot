class FactController < Rubot::Controller
  command :fact do
    if message.text.empty?
      fact = Fact.random
      reply "FACT: #{fact[:fact]}" if fact
    else
      reply "k. got it." if Fact.add(message.text)
    end
  end
end