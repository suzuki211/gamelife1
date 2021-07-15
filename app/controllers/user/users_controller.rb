class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @games = @user.games.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_user_path(@user.id)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end


end
