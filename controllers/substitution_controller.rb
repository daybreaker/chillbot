class SubstitutionController < Rubot::Controller
  listener do
    BigBrother.spy(message) unless message.text =~ %r{^/?s/([^/]+)/([^/]+)/?$}i
  end

  listener :matches => %r{^((\w+)[,:]? )?/?s/([^/]+)/([^/]+)/?$}i do
    attn = matches[2]
    last = BigBrother.last(attn || message.from)
    if last
      if attn
        reply "#{attn}: #{last.gsub(Regexp.new(matches[3]), matches[4]).chomp('.')}. ftfy"
      else
        # gsub! alters the last message in history, so further substitutions
        # can be made. who needs this feature? no idea
        reply last.gsub!(Regexp.new(matches[3]), matches[4]) || "User Fail"
      end
    else
      reply "#{message.from}: big brother hasn't spied on you yet"
    end
  end
  
  listener :matches => %r{.*(\bsmash\b|\bbang\b).*}i do
    reply "Hey #{message.from}, did you mean smang?"
  end
  
  listener :matches => /diablo 3/ do
    reply "GET A LIFE NERD"
  end
  
  listener :matches => /come on chillbot/ do
    t =  Time.new(2012, 5, 15) - Time.now
    mm, ss = t.divmod(60)            #=> [4515, 21]
    hh, mm = mm.divmod(60)           #=> [75, 15]
    dd, hh = hh.divmod(24)           #=> [3, 3]
    reply "%d days, %d hours, %d minutes and %d seconds until Diablo 3... NERD" % [dd, hh, mm, ss]
  end

  on :reload do
    # if only Winston knew about this method...
    BigBrother.clear
  end
end
