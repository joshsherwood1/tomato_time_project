class NotificationController < ApplicationController
  before_action :require_user
  def create
    SummarySenderJob.perform_later(current_user, {correct: 3, total: 10})
    redirect_to game_path(params[:game_id])
  end
end
