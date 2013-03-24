require 'yajl'
require 'uri'
require 'net/http'

class Bitcoin
  def self.url
    'https://mtgox.com/api/1/BTCUSD/ticker'
  end

  def self.stats
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    Yajl::Parser.parse(response.body)
  end

  def self.average_price
    stats['return']['avg']['display']
  end
end
