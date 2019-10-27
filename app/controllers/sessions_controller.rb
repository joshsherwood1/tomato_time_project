class SessionsController < ApplicationController
  def new
    @new ||= User.new
  end

  def log_in(user)
   session[:user_id] = user.id
  end

  def googleAuth
    # Get access tokens from the google server
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)

    #See helper method above, creates session
    log_in(user)

    # Access_token is used to authenticate request made from the rails application to the google server
    user.google_token = access_token.credentials.token

    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
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
