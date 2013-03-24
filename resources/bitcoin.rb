require 'yajl'
require 'open-uri'

class Bitcoin
  def self.url
    'https://mtgox.com/api/1/BTCUSD/ticker'
  end

  def self.stats
    Yajl::Parser.parse(open(url).read)
  end

  def self.average_price
    stats['return']['avg']['display']
  end
end
