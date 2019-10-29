class Games::StatsController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end
end
