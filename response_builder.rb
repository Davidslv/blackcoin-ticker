require 'pry'
require 'unirest'
require 'json'

class ResponseBuilder
  CRYPTONATOR_API_URL = 'https://www.cryptonator.com/api/ticker/blk'

  FIATS = %w(eur gbp usd cad pln rur cny)
  CRYPTO_CURRENCY = %w(btc ltc doge xmr)

  def deliver
    hash = {}

    (FIATS + CRYPTO_CURRENCY).each do |fiat|
      response = Unirest.get("#{CRYPTONATOR_API_URL}-#{fiat}")
      json     = response.body['ticker']

      hash.merge!({
        json['target'] => {
          'price'  => json['price'],
          'volume' => json['volume'],
          'change' => json['change']
        }
      })
    end

    hash.to_json
  end
end
