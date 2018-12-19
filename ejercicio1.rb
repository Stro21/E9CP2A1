# rubocop:disable AsciiComments
# Clase Table que junta las ganancias de 4 días
class Table
  attr_reader :name, :income
  def initialize(name, day1, day2, day3, day4)
    @name = name
    @income = [day1, day2, day3, day4]
  end
end

data = File.open('casino.txt', 'r'){ |file| file.readlines }
print data
puts ''
# rubocop:enable AsciiComments
