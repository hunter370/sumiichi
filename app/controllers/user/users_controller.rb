class User::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_show_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :icon, :email)
  end
end
