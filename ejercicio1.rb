# rubocop:disable SymbolProc
# rubocop:disable LineLength
# rubocop:disable For

# Class Table gets the earnings of the 4 days.
class Table
  attr_reader :name, :income
  def initialize(name, day1, day2, day3, day4)
    @name = name
    @income = [day1.to_i, day2.to_i, day3.to_i, day4.to_i]
  end

  def best_day
    puts "El mejor día de la #{name} es el día #{income.index(income.max) + 1} y sus ganancias fueron #{income.max}"
  end
end

# Class Day that have the earnings of each table.
class Day
  attr_reader :name, :tables
  def initialize(name, tables)
    @name = "día #{name}"
    @tables = tables
  end

table_array = []
tables = []
data = File.open('casino.txt', 'r') { |file| file.readlines }
  table_array = table_s.split(', ').map(&:chomp)
  tables << Table.new(*table_array)
end
days = []
tables.each { |table| table.best_day }
# Since we don't use an array, for is the best case instead of each.
for i in 0..3
  a = [tables[0].income[i], tables[1].income[i], tables[2].income[i], tables[3].income[i]]
  days << Day.new(i + 1, a)
end
days.each { |day| day.average }

# rubocop:enable SymbolProc
# rubocop:enable LineLength
# rubocop:enable For
