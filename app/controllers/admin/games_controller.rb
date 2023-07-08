class Admin::GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.new
    @games = Game.all
  end

  def create
      @game = Game.create!(
        tournament_id: params[:tournament_id],
        date: params[:date],
        order: params[:order],
        round: params[:round],
        score: '試合前'
      )
      @game.game_teams.create(team_id: params[:first_base_team_id], first_base: true)
      @game.game_teams.create(team_id: params[:third_base_team_id], first_base: false)
    redirect_to admin_tournament_path(params[:tournament_id].to_i)
  end

  def edit
    @game = Game.find(params[:id])
    @tournament = @game.tournament
    @teams = @tournament.teams
    @team_ids = @game.game_teams.pluck(:team_id)
  end

  def update
    @game = Game.find(params[:id])
    tournament = @game.tournament.id
    @game.update!(game_params)
    @gameteam = @game.game_teams
    # binding.pry
    # first_base = @gameteam.find_or_initialize_by(game_id: @game.id, first_base: true)
    # first_base.team_id = params[:first_base_team_id]
    # first_base.save!

    # third_base = @gameteam.find_or_initialize_by(game_id: @game.id, first_base: false)
    # third_base.team_id = params[:third_base_team_id]
    # third_base.save!

    first_base = @gameteam.find_by(game_id: @game.id, first_base: true)
    if first_base.nil?
      @gameteam.create(game_id: @game.id, first_base: true, team_id: params[:game][:first_base_team_id])
    else
      first_base.update(team_id: params[:game][:first_base_team_id])
    end

    third_base = @gameteam.find_by(game_id: @game.id, first_base: false)
    if third_base.nil?
      @gameteam.create(game_id: @game.id, first_base: false, team_id: params[:game][:third_base_team_id])
    else
      third_base.update(team_id: params[:game][:third_base_team_id])
    end


    # @gameteam.update(game_id: @game.id, team_ids: params[:first_base_team_id])
    # @gameteam.update(game_id: @game.id, team_ids: params[:third_base_team_id])
    redirect_to admin_tournament_path(tournament)
  end

  private
  def game_params
    params.require(:game).permit(:tournament_id, :date, :order, :round, :score)
  end
end
