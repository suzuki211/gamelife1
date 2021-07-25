class User::SearchesController < ApplicationController
  before_action :authenticate_user_user!

  def search
    @range = params[:range]

    if @range == "UserName"
      @users = User.looks(params[:search], params[:word])
    elsif @range == "GameTitle"
      @games = Game.looks(params[:search], params[:word])
    end
  end
end