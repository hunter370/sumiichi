class User::FavoritesController < ApplicationController
  def create
    support = Support.find(params[:support_id])
    favorite = current_user.favorites.new(support_id: support.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    support = Support.find(params[:support_id])
    favorite = current_user.favorites.find_by(support_id: support.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
