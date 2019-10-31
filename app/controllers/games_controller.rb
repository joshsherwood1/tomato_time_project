class GamesController < ApplicationController
  before_action :require_user
  def new
  end

  def index
    @user = current_user
    @games = current_user.games
  end

  def create
    game = current_user.games.create(game_params)
    if game.save
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
    facade = GamesFacade.new(current_user, params[:id])

    render locals: {
      game_id: params[:id],
      questions: facade.questions,
      total_questions: facade.number_of_questions
    }
  end

  def calculate_score
    if params["question"].nil?
      flash[:error] = "Please answer all questions"
      redirect_to "/games/#{params["game_id"].to_i}" and return
    end

    number_correct = params["question"].values.count {|value| value == "true"}
    game_score = GameScore.create(user_id: current_user.id, game_id: params["game_id"].to_i, score: number_correct)
    total_questions = game_score.game.number_of_questions

    if game_score.game_percent_score == 0
      flash[:error] = "You got #{number_correct} correct answers! Please try again."
    elsif game_score.game_percent_score < 50.0
      flash[:success] = "You got #{number_correct} correct answers out of #{total_questions}! Good try. Just remember, the more you know the more you grow!"
    else
      flash[:success] = "You got #{number_correct} correct answers out of #{total_questions}!!! You're ripe with Knowledge!"
    end
    redirect_to "/games/#{params["game_id"].to_i}/end"
  end

  private
  def game_params
    params.permit(:custom_name, :number_of_questions, :category, :difficulty)
  end
end
