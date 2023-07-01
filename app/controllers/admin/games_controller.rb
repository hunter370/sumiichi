class Admin::GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.new
    @games = Game.all
  end
  
  def create
    Game.transaction do
      @game = Game.create!(
        tournament_id: params[:tournament_id],
        date: params[:date],
        order: params[:order],
        round: params[:round],
        score: 0
      )
      GameTeam.create!(game_id: @game.id, team_id: params[:first_base_team_id])
      GameTeam.create!(game_id: @game.id, team_id: params[:third_base_team_id])
    end
    redirect_to admin_tournament_path(params[:tournament_id].to_i)
  end

  def edit
  end
  
  private
  def game_params
    params.require(:game).permit(:tournament_id, :date, :order, :round, :score)
  end
end
