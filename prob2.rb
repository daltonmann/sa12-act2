require 'httparty'

def fetch_crypto_data
  url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

def top_five_cryptos(data)
  sorted_data = data.sort_by { |crypto| -crypto['market_cap'] }
  sorted_data.first(5).map { |crypto| [crypto['name'], crypto['current_price'], crypto['market_cap']] }
end

def display_top_five_cryptos(cryptos)
  puts "Top 5 Cryptocurrencies by Market Cap:"
  cryptos.each_with_index do |crypto, index|
    puts "#{index + 1}. #{crypto[0]} - Price: $#{crypto[1]}, Market Cap: $#{crypto[2]}"
  end
end

# Example usage
crypto_data = fetch_crypto_data
top_cryptos = top_five_cryptos(crypto_data)
display_top_five_cryptos(top_cryptos)
