require 'securerandom'

class Lunchtrain
  attr_reader :id
  attr_accessor :time, :destination, :riders

  def initialize destination, time
    unless time =~ /\d{1,2}:\d{2}/
      raise "lunchtrain: invalid time format: #{time}"
    end

    unless destination
      raise "lunchtrain: destination is required"
    end

    @id = SecureRandom.hex 5
    @riders = []
    @time = time
    @destination = destination.upcase
  end

  def departure_alert
    "Lunchtrain departing for #{@destination}. All aboard: #{@riders.join(', ')}"
  end

  def to_s
    "#{@id} #{@destination} @ #{@time}: #{@riders.join(', ')}"
  end

  def departs_in_seconds
    hour, minute = time.split(':')

    now = Time.now
    depart_time = Time.new(now.year, now.month, now.day, hour, minute)

    (depart_time - now).round
  end
end
