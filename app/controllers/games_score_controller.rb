class GamesScoreController < ApplicationController
  def destroy
    current_user.game_score.delete_all
    redirect_to profile_path
  end
end
