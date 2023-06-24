class Admin::TeamsController < ApplicationController
  def show
    @team = Team.new
    @teams = Team.all
  end

  def create
    @team = Team.new
    @team.prefecture = params[:prefecture]
    @team.team_name = params[:team_name]
    @team.number = params[:number]
    @team.grade = params[:grade]
    @team.tournament_id = params[:tournament_id]
    # binding.pry
    @team.save!
    redirect_to admin_tournament_path(params[:tournament_id].to_i)
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    #binding.pry
  @team = Team.find(params[:id])
    # @team.prefecture = params[:prefecture]
    # @team.team_name = params[:team_name]
    # @team.number = params[:number]
    # @team.grade = params[:grade]
    # @team.tournament_ids = params[:tournament_id]
    @team.update(team_params)
    redirect_to admin_tournaments_path
  end

   private
  def team_params
    params.require(:team).permit(:tournament_id, :prefecture, :team_name, :number, :grade)
  end
end
