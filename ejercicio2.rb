# rubocop:disable SymbolProc
# rubocop:disable RaiseArgs

require 'date'

# Class is of a teaching class that have 3 parameters
class Course
  attr_reader :name, :date_init, :date_finish
  def initialize(name, date_init, date_finish)
    @name = name
    @date_init = Date.parse(date_init)
    @date_finish = Date.parse(date_finish)
  end

  def started_in(date)
    date_init < date
  end

  def finish_in(date)
    date_finish > date
  end
end

def create_data(text_file)
  data = File.open(text_file, 'r') { |file| file.readlines }
  array = []
  courses = []
  data.each do |line|
    array = line.split(', ').map(&:chomp)
    courses << Course.new(*array)
  end
  courses
end

def start_before(courses, date = Date.today)
  if date >= Date.parse('2018-01-01.')
    raise ArgumentError.new('La fecha tiene que ser menor que 01-01-2018.')
  end

  puts "Los cursos que empezarón antes de la fecha #{date} son:"
  courses.each { |course| puts course.name if course.started_in(date) }
end

def ended_after(courses, date = Date.today)
  if date >= Date.parse('2018-01-01.')
    raise ArgumentError.new('La fecha tiene que ser menor que 01-01-2018.')
  end

  puts "Los cursos que terminarón después de la fecha #{date} son:"
  courses.each { |course| puts course.name if course.finish_in(date) }
end

courses = create_data('cursos.txt')
start_before(courses, Date.parse('2017-06-01'))
ended_after(courses, Date.parse('2017-09-28'))

# rubocop:enable SymbolProc
# rubocop:enable RaiseArgs
