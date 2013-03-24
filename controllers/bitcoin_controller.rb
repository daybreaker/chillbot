class BitcoinController < Rubot::Controller
  on :connect do
    Scheduler.every "1h" do
      server.message "#iz", "[bitcoin] 1 BTC = #{Bitcoin.average_price} -- last price: #{Bitcoin.last_price}"
    end
  end

  command :btc do
    reply "[bitcoin] 1 BTC = #{Bitcoin.average_price} -- last price: #{Bitcoin.last_price}"
  end
end
