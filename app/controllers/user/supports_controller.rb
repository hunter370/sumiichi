class User::SupportsController < ApplicationController
  def index
  end
  
  def alps_first
    @game = Game.find(params[:id])
    @support = Support.new
    @supports = Support.all
  end
  
  def alps_third
    @game = Game.find(params[:id])
    @support = Support.new
    @supports = Support.all
  end
  
  def stand
    @game = Game.find(params[:id])
  end
  
  def create
    @support = Support.new(support_params)
    @support.user_id = current_user.id
    @support.save!
     redirect_to games_path
  end
  
  private
  def support_params
    params.require(:support).permit(:game_id, :alps_first, :alps_third, :stand)
  end
end
