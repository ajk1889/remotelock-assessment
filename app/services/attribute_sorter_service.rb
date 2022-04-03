require_relative "../models/person"

class AttributeSorterService
  def initialize(people_data, sort_by)
    @people_data = people_data
    @sort_by = sort_by
  end

  def process
    people_data
      .map { |attributes| Person.new(**attributes) }
      .sort_by! { |person| person.send(sort_by) }
  end

  private

    attr_reader :people_data, :sort_by
end
