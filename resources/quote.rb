class Quote < Sequel::Model
  def self.random
    # this is a pretty shitty way of getting a random record
    DB["select * from quotes order by random() limit 1"].first
  end
  
  def self.add(quote, author)
    self.insert :quote => quote, :author => author
  end

  def self.parse(message)
    if message =~ /<(.*)>/ || message =~ /--(.*)$/
      author = $1
    end

    [message, author]
  end
end

