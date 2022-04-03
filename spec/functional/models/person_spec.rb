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

    it 'should have names properly assigned' do
      %i[first_name last_name].each do |key|
        expect(person.send(key)).to eq(attributes[key])
      end
    end

    it 'should have birthdate properly assigned' do
      expect(person.birthdate.strftime("%-m/%-d/%Y")).to eq("4/5/1947")
    end

    it 'should have city properly assigned' do
      expect(person.city.long_name).to eq("Chicago")
    end

    it 'should convert to string in `<first_name>, <city>, <birth_date M/D/YYYY>` format' do
      expect(person.to_s).to eq("Amaljith, Chicago, 4/5/1947")
    end
  end
end
