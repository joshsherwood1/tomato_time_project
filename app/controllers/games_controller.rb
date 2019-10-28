class GamesController < ApplicationController

  def new
  end

  def index
    @games = current_user.games
    @user = current_user
  end

  def create
    game = current_user.games.create(game_params)
    if game.save
      #QuestionAnswersApi.new(game).get_questions_and_answers
      redirect_to "/games"
    else
      flash[:error] = game.errors.full_messages.to_sentence
      redirect_to "/games/new"
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    binding.pry
    redirect_to games_path
  end

  def show
    # game spec
    game = current_user.games.find(params[:id])

    # create a new game_score object
    scoreboard = current_user.game_score.create(game: game, user: current_user)

    # consume TomatoTime API
    @fetched_questions = TomatoTimeApiService.get_data(category: game.category, difficulty: game.difficulty, amount: game.number_of_questions)
    @questions = @fetched_questions.take(game.number_of_questions.to_i) #failsafe incase more questions get returned
    # render game show page
    render locals: {
      questions: @questions,
      score: scoreboard.score
    }
  end

  private

  def game_params
    params.permit(:custom_name, :number_of_questions, :category, :difficulty)
  end
end
