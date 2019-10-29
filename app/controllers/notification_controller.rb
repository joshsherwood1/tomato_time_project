class NotificationController < ApplicationController
  def create
    SummarySenderJob.perform_later(current_user, {correct: 3, total: 10})
    redirect_to game_path(params[:game_id])
  end
end
