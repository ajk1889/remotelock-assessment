require 'spec_helper'

RSpec.describe 'CSV parser Test' do
  describe 'raw string data is converted to list of hashes' do
    let(:data) do
      File.read('spec/fixtures/people_by_dollar.txt')
    end
    let(:csv_parser) { CsvParserService.new(data, " $ ") }

    it 'parses raw input data to list of hashes based linked to headers' do
      parsed_data = csv_parser.process

      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(parsed_data).to eq [
        {city: "LA", birthdate: "30-4-1974", last_name: "Nolan", first_name: "Rhiannon"},
        {city: "NYC", birthdate: "5-1-1962", last_name: "Bruen", first_name: "Rigoberto"}
      ]
    end
  end
end
