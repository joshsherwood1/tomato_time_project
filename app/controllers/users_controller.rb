class UsersController < ApplicationController
  before_action :require_user, except: [:new, :create]

  def show
    @user = current_user
  end
end
