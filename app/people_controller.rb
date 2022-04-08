require_relative "services/csv_parser_service"
require_relative "services/attribute_sorter_service"

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    dollar_parsed_data = CsvParserService.new(params[:dollar_format], " $ ").process
    percent_parsed_data = CsvParserService.new(params[:percent_format], " % ").process

    pipe_parsed_data = !params[:pipe_format].nil? ?
      CsvParserService.new(params[:pipe_format], " | ").process :
      []
    all_people_data = dollar_parsed_data + percent_parsed_data + pipe_parsed_data
    AttributeSorterService.new(all_people_data, params[:order]).process.map!(&:to_s)
  end

  private

    attr_reader :params
end
