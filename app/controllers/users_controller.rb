class UsersController < ApplicationController
  before_action :require_user, except: [:new, :create]

  def show
    @user = current_user
  end

  def invite
    @user = current_user
  end

  def send_invite
    friend_email = params[:email]

    if User.already_user?(friend_email)
      redirect_to invite_path
      flash[:error] = 'This user is already registered on our site.'
    elsif not_valid_email?(friend_email)
      flash[:error] = 'Please enter a valid email address.'
      redirect_to invite_path
    else
      InviteFriendMailer.invite_friend(current_user, friend_email, server_origin).deliver_now
      flash[:success] = 'Successfully sent invite!'
      redirect_to invite_path
    end
  end

  private
  def server_origin
    request.env['HTTP_HOST']
  end
end
