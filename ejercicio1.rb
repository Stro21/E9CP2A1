# rubocop:disable SymbolProc

# Class Table gets the earnings of the 4 days
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

  def bigger_earnings
    income.max
  end

  # def best_day
  #   income.each_index do { |i| return i + 1 if income[i] == bigger_earnings }
  # end
end

table_array = []
tables = []
data = File.open('casino.txt', 'r') { |file| file.readlines }
data.each do |table_s|
  table_array = table_s.split(', ').map(&:chomp)
  name, d1, d2, d3, d4 = table_array
  tables.push(Table.new(name, d1.to_i, d2.to_i, d3.to_i, d4.to_i))
end

puts tables[0].bigger_earnings

# rubocop:enable SymbolProc
