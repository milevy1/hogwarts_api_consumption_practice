class HogwartsService
  def initialize(house)
    @house = houses[house.to_sym]
  end

  def houses
    { 'Griffyndor': '1',
      'Ravenclaw': '2',
      'Hufflepuff': '3',
      'Slytherin': '4'
    }
  end

  def conn
    Faraday.new("https://hogwarts-as-a-service.herokuapp.com/api/v1/house/") do |f|
      f.adapter Faraday.default_adapter
      f.headers["x_api_key"] = ENV['x_api_key']
    end
  end

  def response
    conn.get(@house)
  end

  def students_json
    JSON.parse(response.body)
  end
end
