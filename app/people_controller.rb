require_relative "services/people_parser_service"

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    people = PeopleParserService.new(
      dollar_format: params[:dollar_format],
      percent_format: params[:percent_format]
    ).process
  end

  private

  attr_reader :params
end
