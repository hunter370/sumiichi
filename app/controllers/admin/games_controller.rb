class Admin::GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.new
    @games = Game.all
  end
  
  def create
    @game = Game.new
    @game.tournament_id = params[:tournament_id]
    @game.date = params[:date]
    @game.order = params[:order]
    @game.round = params[:round]
    @game.score = params[:score]
    @game.save!
    redirect_to admin_tournament_path(params[:tournament_id].to_i)
  end

  def edit
  end
  
  private
  def game_params
    params.require(:game).permit(:tournament_id, :date, :order, :round, :score)
  end
end
