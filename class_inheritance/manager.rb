require_relative "employee"
class Manager < Employee
  attr_writer :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    sum = sum_salaries
    sum * multiplier
  end

  def sum_salaries
    return self.salary unless self.is_a? (Manager)
    sum = 0
    @employees.each { |emp| sum += emp.sum_salaries }
    sum
  end
end
