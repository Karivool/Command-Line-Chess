require 'byebug'

class Employee
  attr_accessor :name, :title, :salary, :boss, :subordinates

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @subordinates = nil
    boss.add_subordinate(self) unless boss.nil?
  end

  def bonus(multiplier)
    salary * multiplier
  end


end


class Manager < Employee
  attr_reader :subordinates

  def initialize(name,title,salary,boss=nil)
    super
    @subordinates = []
  end

  def bonus(multiplier)
    #debugger
    bonus = subordinates.inject(0) { |sum, worker| sum += worker.salary}
    bonus *= multiplier
  end

  def add_subordinate(employee)
    unless employee.is_a?(Manager)
      subordinates << employee
    else
      subordinates << employee
      employee.subordinates.each { |subord| add_subordinate(subord) }
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  ned = Manager.new("Ned","founder",1000000)
  shawna = Employee.new("Shawna","TA",12000)
  david = Employee.new("David","TA",10000)
  darren = Manager.new("Darren","TA Manager",78000)
  # darren.add_subordinate(shawna)
  # darren.add_subordinate(david)
  # ned.add_subordinate(darren)

  puts ned.subordinates
  puts ned.bonus(5)
end
