class ReminderController < Rubot::Controller
  command :remind do
    if message.text =~ /([a-z0-9]+) (.+)/i
      Scheduler.in($1) do
        reply "#{message.from}: #{$2}"
      end

      reply "reminder saved"
    else
      reply "invalid format"
    end
  end
end