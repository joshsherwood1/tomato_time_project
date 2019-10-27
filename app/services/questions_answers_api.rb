class QuestionAnswersApi

  def initialize(game)
    @game = game
  end

  def get_questions_and_answers
    response = conn.get('/api/v1',
                        number_of_questions: @game.number_of_questions,
                        difficulty: @game.difficulty,
                        category: @game.category)
    #JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://young-gorge-31211.herokuapp.com/') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
