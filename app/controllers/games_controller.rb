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
    @facade = GamesFacade.new(current_user, params[:id])
    render locals: {
      questions: @facade.questions,
      score: @facade.number_of_questions
    }
  end

  def calculate_score
    number_correct = params["question"].values.count {|value| value == "true"}
    flash[:success] = "You got #{number_correct} correct answers!!! Good job!"
    redirect_to games_path
  end

  private
  def game_params
    params.permit(:custom_name, :number_of_questions, :category, :difficulty)
  end
end
