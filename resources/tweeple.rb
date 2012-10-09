class Tweeple < Sequel::Model(:tweeple)
  unrestrict_primary_key
  
  def self.twitter_ids
    Tweeple.select(:twitter_id).limit(10).collect(&:twitter_id)
  end

  def self.screen_names
    Tweeple.select(:screen_name).limit(10).collect(&:screen_name)
  end
end
