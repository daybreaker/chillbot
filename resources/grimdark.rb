class Grimdark
  def self.quote(topic)
    open("http://proverbinatus.com/quotes/random/#{topic}").read
  end
end
