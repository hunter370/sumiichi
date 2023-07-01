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
        score: '試合前'
      )
      GameTeam.create!(game_id: @game.id, team_id: params[:first_base_team_id])
      GameTeam.create!(game_id: @game.id, team_id: params[:third_base_team_id])
    end
    redirect_to admin_tournament_path(params[:tournament_id].to_i)
  end

  def edit
    @game = Game.find(params[:id])
  end
  
  def update
    @game = Game.find(params[:id])
    tournament = @game.tournament.id
    @game.update!(game_params)
    GameTeam.update!(game_id: @game.id, team_id: params[:first_base_team_id])
    GameTeam.update!(game_id: @game.id, team_id: params[:third_base_team_id])
    redirect_to admin_tournament_path(tournament)
  end
  
  private
  def game_params
    params.require(:game).permit(:tournament_id, :date, :order, :round, :score, :first_base_team_id, :third_base_team_id)
  end
end
