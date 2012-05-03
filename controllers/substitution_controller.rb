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

  on :reload do
    # if only Winston knew about this method...
    BigBrother.clear
  end
end