class Fact < Sequel::Model
  def self.random
    # this is a pretty shitty way of getting a random record
    DB["select * from facts order by random() limit 1"].first
  end
  
  def self.add(fact)
    self.insert :fact => fact
  end
end