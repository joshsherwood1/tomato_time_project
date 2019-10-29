class SessionsController < ApplicationController
  def new
    @new ||= User.new
  end

  def log_in(user)
   session[:user_id] = user.id
  end

  def googleAuth
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    log_in(user)
    user.google_token = access_token.credentials.token
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save
    redirect_to games_path
  end

  def destroy
    session.delete(:user_id)
    current_user = nil
    redirect_to root_path
    flash[:success] = "You have been logged out! Come play again soon!"
  end
end
