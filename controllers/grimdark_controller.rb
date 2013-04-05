# Retrieve a random Warhammer 40,000 proverb or random proverb of a certain topic
class GrimdarkController < Rubot::Controller
  command :grimdark, :'40k' do
    reply Grimdark.quote(message.text)
  end
end
