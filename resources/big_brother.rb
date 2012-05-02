class BigBrother
  def self.log
    @log ||= {}
  end

  def self.spy(message)
    log[message.from] = message.text
  end

  def self.last(nick)
    log[nick]
  end

  def self.clear
    log.clear
  end
end