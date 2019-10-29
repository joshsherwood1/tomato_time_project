class GamesController < ApplicationController
  def new
  end

  def index
    @user = current_user
    @games = current_user.games

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
    redirect_to games_path
  end

  def show
    # game spec

    @game = current_user.games.find(params[:id])

    # create a new game_score object
    scoreboard = current_user.game_score.create(game: @game, user: current_user)

    # consume TomatoTime API
    @questions = TomatoTimeApiService.get_data(category: @game.category, difficulty: @game.difficulty, amount: @game.number_of_questions)
    @number_of_questions = @game.number_of_questions.to_i

    # render game show page
    render locals: {
      questions: @questions,
      score: scoreboard.score
    }
  end

  def calculate_score
    number_correct = params["question"].values.count {|value| value == "true"}
    total_questions = params["question"].values.count
    game_score = GameScore.new(user_id: current_user.id, game_id: params["game_id"].to_i, score: number_correct)
    flash[:success] = "You got #{number_correct} correct answers out of #{total_questions}!!! Good job!"
    redirect_to "/games/#{params["game_id"].to_i}/end"
  end

  private
  def game_params
    params.permit(:custom_name, :number_of_questions, :category, :difficulty)
  end
end
