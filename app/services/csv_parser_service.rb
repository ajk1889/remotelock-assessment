class CsvParserService
  def initialize(data, separator)
    @data = data
    @separator = separator
  end

  def process
    lines = data.split("\n")
    header = lines.delete_at(0) # remove and obtain the header
      .split(separator).map(&:to_sym)
    data_hash = lines.map { |line| header.zip(line.split(separator)).to_h }
  end

  private

    attr_reader :data, :separator
end
