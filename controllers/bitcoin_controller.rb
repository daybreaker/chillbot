class BitcoinController < Rubot::Controller
  on :connect do
    Scheduler.every "1h" do
      do_shit_aight
    end
  end

  command :btc do
    do_shit_aight
  end

  def do_shit_aight
    response = Bitcoin::Call.new

    server.message "#iz", "[bitcoin] 1 BTC = #{response.average_price} -- last price: #{response.last_price}"

    if response.really_good_time_to_buy?
      server.message "#iz", "hey mculp, it's a *really* good time to buy."
    elsif response.good_time_to_buy?
      server.message "#iz", "hey mculp, it's a good time to buy."
    elsif response.SELL_QUICK_WTF_COME_ON?
      server.message "#iz", "hey mculp, it's a good time to sell."
    elsif response.HOLY_FUCKING_SHIT_SELL_NOW?
      server.message "#iz", "hey mculp, it's a *really* good time to sell."
    end
  end
end
