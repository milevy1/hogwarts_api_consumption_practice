class StudentSearchFacade
  def initialize(house)
    @house = house
  end

  def total_students
    "#{students_json.count} Students"
  end

  def students
    students_json.map do |student_data|
      Student.new(student_data)
    end
  end

  private
    def hogwarts_service
      @_hogwarts_service ||= HogwartsService.new(@house)
    end

    def students_json
      @_students_json ||= hogwarts_service.students_json
    end
end
