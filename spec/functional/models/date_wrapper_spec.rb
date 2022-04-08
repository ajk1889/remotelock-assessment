require 'spec_helper'

RSpec.describe 'Date wrapper test' do
  describe 'Dates should be properly parsed in three formats "30-4-1974", "1986-05-29", "10.24.1990"' do
    let(:date_formats) do
      ["10.24.1990", "30-4-1974", "1986-05-29"]
    end

    it 'should correctly parse all given date formats' do
      parsed_dates = date_formats
        .map { |date_format| DateWrapper.new(date_format) }
        .map { |date_wrapper| date_wrapper.strftime("%-m/%-d/%Y") }
      expect(parsed_dates).to eq(["10/24/1990", "4/30/1974", "5/29/1986"])
    end

    it 'should correctly sort given dates in different formats' do
      parsed_dates = date_formats
        .map { |date_format| DateWrapper.new(date_format) }
        .sort
        .map { |date_wrapper| date_wrapper.strftime("%-m/%-d/%Y") }
      expect(parsed_dates).to eq(["4/30/1974", "5/29/1986", "10/24/1990"])
    end
  end
end
