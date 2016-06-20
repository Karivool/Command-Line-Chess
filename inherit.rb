require 'byebug'

class Employee
  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end

end


class Manager < Employee
  attr_reader :subordinates

  def initialize
    @subordinates = []
  end

  def bonus(multiplier)
    #debugger
    bonus = subordinates.inject(0) { |sum, worker| sum += worker.salary }
    bonus *= multiplier
  end

  def add_subordinate(employee)
    subordinates << employee
    employee.boss = self
  end

end
