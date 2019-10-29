class NotificationController < ApplicationController
  def create
    UserNotifierMailer.inform(current_user, current_user.email).deliver_now
    # redirect_to root_url
  end
end
