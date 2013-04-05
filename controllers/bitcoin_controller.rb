class BitcoinController < Rubot::Controller
  on :connect do
    Scheduler.every "1h" do
      response = Bitcoin::Call.new

      server.message "#iz", "[bitcoin] 1 BTC = #{response.average_price} -- last price: #{response.last_price}"

      if response.really_good_time_to_buy?
        server.message "#iz", "hey mculp, it's a *really* good time to buy."
      elsif response.good_time_to_buy?
        server.message "#iz", "hey mculp, it's a good time to buy."
      end
    end
  end

  command :btc do
    reply "[bitcoin] 1 BTC = #{Bitcoin.average_price} -- last price: #{Bitcoin.last_price}"
  end
end
