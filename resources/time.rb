class Time
  # note: this is not the rails method, there are no approximates
  def time_ago_in_words
    seconds = Time.now - self

    time = "#{(seconds % 60).to_i} seconds"

    minutes = seconds / 60

    if minutes >= 1
      hours = minutes / 60
      time.insert(0, "#{(minutes % 60).to_i} minutes ")

      if hours >= 1
        days = hours / 24
        time.insert(0, "#{(hours % 24).to_i} hours ")

        if days >= 1
          time.insert(0, "#{days.to_i} days ")
        end
      end
    end

    time
  end
end