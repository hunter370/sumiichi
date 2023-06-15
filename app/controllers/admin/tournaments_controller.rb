class Admin::TournamentsController < ApplicationController
  def new
    @tournament = Tournament.new
  end
  
  def create
    @tournament = Tournament.new(tournament_params)
    # binding.pry
    @tournament.save
    redirect_to admin_tournaments_path
  end

  def index
    @tournaments = Tournament.all
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end
  
  def update
    @tournament = Tournament.find(params[:id])
    @tournament.update(tournament_params)
    redirect_to admin_tournaments_path
  end
  
  def show
    @tournament = Tournament.find(params[:id])
    @teams = @tournament.teams
  end
  
  private
  def tournament_params
    params.require(:tournament).permit(:tytle, :short_tytle)
  end
end
