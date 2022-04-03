require_relative "services/people_parser_service"

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    people = PeopleParserService.new(
      dollar_sep_data: params[:dollar_format],
      percent_sep_data: params[:percent_format]
    ).process
    # we don't use `people` anymore, we can mutate it in place for performance
    people
      .sort_by! { |person| person.send(params[:order]) }
      .map!(&:to_s)
  end

  private

    attr_reader :params
end
