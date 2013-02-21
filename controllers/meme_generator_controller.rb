class MemeGeneratorController < Rubot::Controller
  command :goodnews do
    reply MemeGenerator.good_news message.text
  end
end
