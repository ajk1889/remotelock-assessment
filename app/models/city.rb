class City
  # populate this with all known cities
  CITY_CODES_DICTIONARY = { LA: "Los Angeles", NYC: "New York City", CHI: "Chicago" }

  def initialize(city)
    @city = city
  end

  def long_name
    CITY_CODES_DICTIONARY[city.to_sym] || city
  end

  private

    attr_reader :city
end
