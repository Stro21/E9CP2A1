# rubocop:disable SymbolProc
# rubocop:disable LineLength

# Class Table gets the earnings of the 4 days
class Table
  attr_reader :name, :income
  def initialize(name, day1, day2, day3, day4)
    @name = name
    @income = [day1.to_i, day2.to_i, day3.to_i, day4.to_i]
  end

  # def average
  #   suma = income.inject { |sum, n| sum + n }
  #   puts "El promedio de lo recaudado por todas las mesas es es #{suma / 4}"
  # end

  def best_day
    puts "El mejor día de la #{name} es el día #{income.index(income.max) + 1} y sus ganancias fueron #{income.max}"
  end
end

def average
  suma = income.inject { |sum, n| sum + n }
  puts "El promedio de lo recaudado por todas las mesas es es #{suma / 4}"
end

table_array = []
tables = []
data = File.open('casino.txt', 'r') { |file| file.readlines }
data.each do |table_s|
  table_array = table_s.split(', ').map(&:chomp)
  tables << Table.new(*table_array)
end
tables.each do |table|
  table.best_day
  table.average
end

# rubocop:enable SymbolProc
# rubocop:enable LineLength
