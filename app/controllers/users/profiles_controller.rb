class Users::ProfilesController < ApplicationController

  def show
    @user = current_user 
  end

  def update
    @user = current_user 
    @user.update!(user_params)
    redirect_to users_profile_path
  end
  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end

