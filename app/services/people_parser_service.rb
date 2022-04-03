require_relative "../models/person"

class PeopleParserService
  def initialize(dollar_format:, percent_format:)
    @dollar_format = dollar_format.split("\n")
    @percent_format = percent_format.split("\n")
  end

  def process
    dollar_people = to_hash_list(dollar_format, " $ ")
    percent_people = to_hash_list(percent_format, " % ")
    all_people_data = dollar_people + percent_people
    all_people_data.map { |attributes| Person.new(**attributes) }
  end

  private

    attr_reader :dollar_format, :percent_format

    def to_hash_list(lines, separator)
      header = lines.delete_at(0) # remove and obtain the header
        .split(separator).map(&:to_sym)
      data_hash = lines.map { |line| header.zip(line.split(separator)).to_h }
    end
end
