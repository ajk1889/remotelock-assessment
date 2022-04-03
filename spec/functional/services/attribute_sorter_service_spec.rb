require 'spec_helper'

RSpec.describe 'People sorter Test' do
  describe 'A list of people attributes is sorted based on given attribute' do
    let(:data) do
      [
        {first_name: "Mckayla", city: "Atlanta", birthdate: "5/5/1986"},
        {first_name: "Elliot", city: "New York City", birthdate: "5/4/1947"},
        {first_name: "Rhiannon", city: "Los Angeles", birthdate: "4/3/1974"},
      ]
    end
    let(:first_name_sorter) { AttributeSorterService.new(data, "first_name") }
    let(:birthdate_sorter) { AttributeSorterService.new(data, "birthdate") }

    it 'sorts given list of hashes containing user data in the basis of first_name' do
      parsed_data = first_name_sorter.process

      expect(parsed_data[0].first_name).to eq "Elliot"
      expect(parsed_data[1].first_name).to eq "Mckayla"
      expect(parsed_data[2].first_name).to eq "Rhiannon"
    end

    it 'sorts given list of hashes containing user data in the basis of birthday' do
      parsed_data = birthdate_sorter.process

      expect(parsed_data[0].first_name).to eq "Elliot"
      expect(parsed_data[1].first_name).to eq "Rhiannon"
      expect(parsed_data[2].first_name).to eq "Mckayla"
    end
  end
end
