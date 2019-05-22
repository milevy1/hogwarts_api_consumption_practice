class HogwartsService
  def initialize(house)
    @house = house
  end

  def conn
    Faraday.new("http://hogwarts-it.herokuapp.com/api/v1/house/") do |f|
      f.adapter Faraday.default_adapter
      f.params['api_key'] = ENV['api_key']
    end
  end

  def response
    conn.get(@house)
  end

  def students_json
    JSON.parse(response.body)['data'][0]['attributes']['students']
  end
end
