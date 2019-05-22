class Student
  attr_reader :id, :name

  def initialize(student_data)
    @id = student_data['id']
    @name = student_data['name']
  end
end
