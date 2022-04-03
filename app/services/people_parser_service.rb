require_relative "../models/person"

class PeopleParserService
  def initialize(dollar_sep_data:, percent_sep_data:)
    @dollar_sep_data = dollar_sep_data
    @percent_sep_data = percent_sep_data
  end

  def process
    dollar_people = to_hash_list(dollar_sep_data, " $ ")
    percent_people = to_hash_list(percent_sep_data, " % ")
    all_people_data = dollar_people + percent_people
    all_people_data.map { |attributes| Person.new(**attributes) }
  end

  private

    attr_reader :dollar_sep_data, :percent_sep_data

    def to_hash_list(data, separator)
      lines = data.split("\n")
      header = lines.delete_at(0) # remove and obtain the header
        .split(separator).map(&:to_sym)
      data_hash = lines.map { |line| header.zip(line.split(separator)).to_h }
    end
end
