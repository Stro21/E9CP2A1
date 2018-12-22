# Class is of a teaching class that have 3 parameters
class Course
  attr_reader :name, :date_init, :date_finish
  def initialize(name, date_init, date_finish)
    @name = name
    @date_init = date_init
    @date_finish = date_finish
  end
end
