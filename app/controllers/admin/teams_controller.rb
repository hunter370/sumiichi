class Admin::TeamsController < ApplicationController
  def index
    @team = Team.new
    @teams = Team.all
  end
  
  def create
    @team = Team.new(team_params)
    @team.save
    redirect_to admin_teams_path
  end

  def show
  end

  def edit
  end
  
   private
  def team_params
    params.require(:team).permit(:prefecture, :team_name, :number, :grade)
  end
end
