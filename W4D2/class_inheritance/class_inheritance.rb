require "byebug"

class Employee
  attr_reader :name, :title, :salary 
  attr_accessor :boss, :employees
  # debugger
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def inspect
    @name.inspect
  end

  # def assign_boss(boss)
  #   @boss = boss
  # end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end
end

class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary, boss=nil, employees = [])
    super(name, title, salary, boss) #will call initialize from Employee
    @employees = employees #extra variable for Manager class
  end

  # def inspect
  #   @employees.inspect
  # end
  
  

  def assign_employee(*employee)
    employee.each do |emp|
      @employees << emp
      # remove employee from @employees of previous boss, if statement
      if emp.boss #same as !emp.boss.nil?
        emp.boss.employees.delete(emp)
        emp.boss = self
      else
        emp.boss = self
      end
    end
  end

  def bonus(multiplier)
    queue = [] + self.employees
    salary_sum = 0
    until queue.empty?
      current_person = queue.shift
      salary_sum += current_person.salary
      queue += current_person.employees if current_person.employees
      # debugger
      
    end
    bonus = salary_sum * multiplier
    return bonus
  end
end

darren = Manager.new("Darren", "TA Manager", 78000)
ned = Manager.new("Ned", "Founder", 1000000)

shawna = Employee.new("Shawna", "TA", 12000)
david = Employee.new("David", "TA", 10000)

ned.assign_employee(darren)
darren.assign_employee(shawna, david)

p ned
p ned.employees
p darren.employees

p ned.bonus(5)
p darren.bonus(4)
p shawna.bonus(3)
p david.bonus(3)