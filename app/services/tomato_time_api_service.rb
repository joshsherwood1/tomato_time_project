class TomatoTimeApiService
  def self.get_data(category:, difficulty:, amount:)
    new.get_data(category, difficulty, amount)
  end

  def get_data(category, difficulty, amount)
    response = conn.get 'questions', {
      category: category,
      difficulty: difficulty,
      amount: amount
    }
    json = JSON.parse(response.body, symbolize_names: true)
  end


  private

  def conn
    Faraday.new(:url => 'https://tomato-time-api.herokuapp.com/api/v1/') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  # def map_to_number
  #   map = {
  #     "Geography" => '22',
  #     'History'=> '23',
  #     'Books'=> '10',
  #     'Movies'=> '11',
  #     'Television'=> '14',
  #     'Music'=> '12',
  #     'General Knowledge'=> '9',
  #     'Science & Nature'=> '17'
  #   }
  # end
end
