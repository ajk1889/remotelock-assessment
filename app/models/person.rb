require "date"
require_relative "./city"

class Person
  attr_reader :city, :birthdate, :first_name

  def initialize(city:, birthdate:, first_name:, last_name: nil)
    @city = City.new(city)
    @birthdate = Date.parse(birthdate)
    @first_name = first_name
    # we don't care about the last_name, no need to set it.
  end

  def to_s
    "#{first_name}, #{city.long_name}, #{birthdate.strftime("%-m/%-d/%Y")}"
  end
end
