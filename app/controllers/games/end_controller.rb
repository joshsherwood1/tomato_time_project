class Games::EndController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end
end
