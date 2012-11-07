class Quote < Sequel::Model
  def self.random
    # this is a pretty shitty way of getting a random record
    DB["select * from quotes order by random() limit 1"].first[:quote]
  end

  def self.search(term)
    where("lower(quote) like '%#{term.downcase}%'").all.sample.try(:[], :quote) || "nothing matched #{term}"
  end

  def self.add(quote, author)
    self.insert :quote => quote, :author => author
  end

  def self.parse(message)
    # parses author name from typical irc paste: <rhiza> quotequotequote
    # or parses author name from --rhiza at end of line
    if message =~ /^<(.*)>/ || message =~ /--(.*)$/
      author = $1
    end

    [message, author]
  end
end

