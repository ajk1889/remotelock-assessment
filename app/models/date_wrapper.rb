require "date"

class DateWrapper
  attr_reader :date

  def initialize(date)
    if date.include?("-")
      @date = Date.parse(date)
    else
      @date = Date.parse(to_valid_format(date))
    end
  end

  def strftime(format)
    date.strftime(format)
  end

  def <=>(other)
    self.date <=> other.date
  end

  private

    def to_valid_format(date)
      month, day, year = date.split(".")
      "#{day}-#{month}-#{year}"
    end
end
