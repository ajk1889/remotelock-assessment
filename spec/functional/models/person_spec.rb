require 'spec_helper'

RSpec.describe 'Person model test' do
  describe 'Person details are properly rendered irrespective of input data format' do
    let(:attributes) do
      {
        birthdate: "5-4-1947",
        first_name: "Amaljith",
        last_name: "k",
        city: "CHI"
      }
    end
    let(:person) { Person.new(**attributes) }

    it 'should convert to string in `<first_name>, <city>, <birth_date M/D/YYYY>` format' do
      expect(person.to_s).to eq("Amaljith, Chicago, 4/5/1947")
    end
  end
end
