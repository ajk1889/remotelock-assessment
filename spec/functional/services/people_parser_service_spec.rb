require 'spec_helper'

RSpec.describe 'People parser service test' do
  describe 'string data is converted to Person objects' do
    let(:dollar_sep_data) { File.read('spec/fixtures/people_by_dollar.txt') }
    let(:percent_sep_data) { File.read('spec/fixtures/people_by_percent.txt') }
    let(:people_parser) {
      PeopleParserService.new(dollar_sep_data: dollar_sep_data, percent_sep_data: percent_sep_data)
    }

    it 'parses raw input data to People objects' do
      people = people_parser.process.map(&:to_s)
      expect(people).to include(
        'Elliot, New York City, 5/4/1947',
        'Mckayla, Atlanta, 5/29/1986',
        'Rhiannon, Los Angeles, 4/30/1974',
        'Rigoberto, New York City, 1/5/1962',
      )
    end
  end
end
