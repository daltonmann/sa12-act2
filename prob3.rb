require 'httparty'

def fetch_current_time(area, location)
  url = "http://worldtimeapi.org/api/timezone/#{area}/#{location}"
  response = HTTParty.get(url)
  parsed_response = JSON.parse(response.body)
  { area: area,
    location: location,
    current_time: parsed_response['datetime'] }
end

def display_current_time(time_data)
  puts "The current time in #{time_data[:area]}/#{time_data[:location]} is #{time_data[:current_time]}"
end

# Example
area = 'Europe'
location = 'London'
time_data = fetch_current_time(area, location)
display_current_time(time_data)
