# rubocop:disable AsciiComments
# rubocop:disable SymbolProc

# Clase Table que junta las ganancias de 4 días
class Table
  attr_reader :name, :income
  def initialize(name, day1, day2, day3, day4)
    @name = name
    @income = [day1, day2, day3, day4]
  end

  def average
    suma = income.inject { |sum, n| sum + n }
    suma / 4
  end
end

table_array = []
mesas = []
data = File.open('casino.txt', 'r') { |file| file.readlines }
data.each do |table_s|
  table_array = table_s.split(', ').map(&:chomp)
  name, d1, d2, d3, d4 = table_array
  mesas.push(Table.new(name, d1.to_i, d2.to_i, d3.to_i, d4.to_i))
end

# rubocop:enable AsciiComments
# rubocop:enable SymbolProc
