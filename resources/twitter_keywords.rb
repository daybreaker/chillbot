class TwitterKeywords < Sequel::Model(:twitter_keywords)
  
  def self.keywords
    TwitterKeywords.select(:keyword).limit(10).collect(&:keyword)
  end

end
