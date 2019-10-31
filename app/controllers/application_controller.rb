class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_user, :not_valid_email

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    render file: "public/404" if current_user.nil?
  end

  def not_valid_email?(friend_email)
    return true if (friend_email =~ URI::MailTo::EMAIL_REGEXP) == nil
  end
end
