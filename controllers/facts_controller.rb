class FactsController < Rubot::Controller
  command :fact do
    if message.text.empty?
      if fact = Fact.random
        reply "80% of #{fact[:fact]}. fact"
      else
        reply "100% of this command has no facts. fact"
      end
    else
      Fact.add message.text.strip # let's get this strip moved into the framework please
    end
  end
end