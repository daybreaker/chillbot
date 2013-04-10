class LunchtrainController < Rubot::Controller
  # meh
  TRAINS = []

  command :lunchtrain do
    message_tokens = message.text.split
    puts message_tokens

    begin
      case message_tokens.shift
      when 'new'
        new_train(message_tokens.shift, message_tokens.join(''))
      when 'list'
        list_trains
      when 'join'
        join_train message_tokens.shift, message.from
      end
    rescue Exception => e
      reply e.message
    end
  end

  private
  def new_train time, destination
    lunchtrain = Lunchtrain.new destination, time
    lunchtrain.riders << message.from

    if lunchtrain.departs_in_seconds < 0
      raise 'lunchtrain: departure time cannot be in the past.'
    end

    Scheduler.in "#{lunchtrain.departs_in_seconds}s" do
      reply lunchtrain.departure_alert
      TRAINS.delete lunchtrain
    end

    reply lunchtrain.to_s
    TRAINS << lunchtrain
  end

  def list_trains
    if TRAINS.any?
      TRAINS.each { |t| reply t.to_s }
    else
      reply 'No trains scheduled.'
    end
  end

  def join_train id, rider
    lunchtrain = TRAINS.find { |t| t.id == id }

    raise "no train found for '#{id}'" unless lunchtrain

    lunchtrain.riders << rider

    reply 'Ticket issued.'
  end
end
