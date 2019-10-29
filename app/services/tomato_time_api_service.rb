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
    binding.pry
  end


  private
  def conn
    Faraday.new(:url => 'https://tomato-time-api.herokuapp.com/api/v1/') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end
