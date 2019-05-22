class StudentSearchFacade
  def initialize(house)
    @house = house
  end

  def total_students
    response = Faraday.get "http://hogwarts-it.herokuapp.com/api/v1/house/#{@house}?api_key=#{ENV['api_key']}"

    count = JSON.parse(response.body)['data'][0]['attributes']['students'].count

    "#{count} Students"
  end

  def students
    response = Faraday.get "http://hogwarts-it.herokuapp.com/api/v1/house/#{@house}?api_key=#{ENV['api_key']}"

    JSON.parse(response.body)['data'][0]['attributes']['students'].map do |student_data|
      Student.new(student_data)
    end
  end
end
