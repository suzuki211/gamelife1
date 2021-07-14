class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @games = @user.games.all
  end
  
end
