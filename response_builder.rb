require 'pry'
require 'unirest'
require 'json'

class ResponseBuilder
  CRYPTONATOR_API_URL        = 'https://www.cryptonator.com/api/ticker/blk'

  FIATS = %w(eur gbp usd pln rur cny)
  CRYPTO_CURRENCY = %w(btc ltc doge xmr)

  def deliver
    blk_usd
  end

  private

  def blk_usd
    response = Unirest.get("#{CRYPTONATOR_API_URL}-usd")
    json     = response.body['ticker']

    {
      json['target'] => {
        'price'  => json['price'],
        'volume' => json['volume'],
        'change' => json['change']
      }
    }.to_json
  end
end
