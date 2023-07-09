class User::TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
    @teams = @tournament.teams
    @games = @tournament.games
  end
  
  private
  def tournament_params
    params.require(:tournament).permit(:tytle, :short_tytle)
  end
end
