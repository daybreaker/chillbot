require "git"

class AdminController < Rubot::Controller
  command :reload, :protected => true do
    dispatcher.reload
    reply "reloaded"
  end

  command :quit, :protected => true do
    dispatcher.quit
  end

  command :up do
    reply server.connected_at.time_ago_in_words
  end

  command :raw, :protected => true do
    server.raw message.text
  end

  command :update, :protected => true do
    begin
      repo = Git.open(Dir.pwd)

      # looks like the pull method isn't working properly, so
      # we specify the individual steps instead
      repo.remote.fetch
      reply repo.remote.merge
    rescue Exception => e
      reply e.message
    end
  end

  command :contributors do
    begin
      repo = Git.open(Dir.pwd)
      logs = repo.log(500) # just get a sufficiently large number for now

      love_u_this_much = { 'ahemard@iseatz.com' => 'Alex Hemard', 'M. Culp' => 'Matt Culpepper' }

      names = logs.map { |log| repo.object(log).author.name }.uniq
      love_u_this_much.keys.each { |key| names.delete(key) }
      names += love_u_this_much.values

      reply names.uniq.join(', ')
    rescue Exception => e
      reply "error retrieving contributors: #{e.message}"
    end
  end

  on :quit do
    puts "totally caught the quit event!"
  end

  on :connect do
    puts "totally caught the connect event!"
  end
  
  on :reload do
    puts "totally caught the reload event!"
  end
end
