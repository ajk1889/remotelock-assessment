require_relative "../models/person"

class PeopleParserService
  def initialize(dollar_format:, percent_format:)
    @dollar_format = dollar_format.split("\n")
    @percent_format = percent_format.split("\n")
  end

  def process
    # todo: implement header based assignment
    dollar_people = @dollar_format.map { |line| Person.new(line, " $ ") }
    percent_people = @percent_format.map { |line| Person.new(line, " % ") }
    return dollar_people + percent_people
  end

  private

  attr_reader :dollar_format, :percent_format
end
