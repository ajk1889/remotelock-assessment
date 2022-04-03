class Person
  attr_reader :city, :birthdate, :first_name, :last_name
  def initialize(data, separator)
    @city, @birthdate, @first_name, @last_name = data.split(separator)
  end
end
