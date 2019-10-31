class Games::EndController < ApplicationController
  before_action :require_user
  
  def show
    @game = Game.find(params[:id])
  end
end
