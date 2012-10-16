class FactController < Rubot::Controller
  command :fact do
    reply "k. got it." if Fact.add(message.text)
  end

  command :free_fact do
    fact = Fact.random[:fact]
    reply "FACT: #{fact}" if fact
  end

end