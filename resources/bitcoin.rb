require 'yajl'
require 'open-uri'

module Bitcoin
  URL = 'https://mtgox.com/api/1/BTCUSD/ticker'

  class Call
    def initialize
      @stats = call_and_then_parse
    end

    def average_price
      @stats['return']['avg']['display']
    end

    def last_price
      @stats['return']['last']['display']
    end

    def good_time_to_buy?
      (average_price.to_f / last_price.to_f) > 1.085
    end

    def really_good_time_to_buy?
      (average_price.to_f / last_price.to_f) > 1.17
    end

    private

    def call_and_then_parse
      json = open(Bitcoin::URL).read
      Yajl::Parser.parse(json)
    end
  end
end
