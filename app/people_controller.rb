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
    # we don't use `people` anymore, we can mutate it in place for performance
    people
      .sort_by! { |person| person.first_name }
      .map! { |person| person.to_s }
  end

  private

    attr_reader :params
end
