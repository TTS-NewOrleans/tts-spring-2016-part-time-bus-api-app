module LocationsHelper

  # Parse the API data to store it in Ruby array of hashes - each bus is a hash
  def fetch_buses_from_api(source_url)
    http = Net::HTTP.get_response(URI.parse(source_url))
    data = http.body
    JSON.parse(data)
  end

  # Return true if bus is near user
  def is_nearby?(user_lat, user_long, bus_lat, bus_long)
    # Max distance in degrees, approx 0.6 miles
    max_distance = 0.01
    difference_latitudes = user_lat - bus_lat.to_f
    difference_longitudes = user_long - bus_long.to_f
    distance = Math.sqrt(difference_latitudes ** 2 + difference_longitudes ** 2)
    distance <= max_distance
  end
end
