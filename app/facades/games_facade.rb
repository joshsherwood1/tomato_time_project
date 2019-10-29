class GamesFacade
  attr_reader :game

  def initialize(current_user, game_id)
    @game = current_user.games.find(game_id)
  end

  def questions
    get_questions.map do |question|
      Question.new(question)
    end.shuffle
  end

  def get_questions
    TomatoTimeApiService.get_data(category: @game.category,
                                  difficulty: @game.difficulty,
                                  amount: @game.number_of_questions)
  end

  def number_of_questions
    @game.number_of_questions.to_i
  end
end
