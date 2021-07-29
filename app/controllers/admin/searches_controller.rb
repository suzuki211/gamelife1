class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin_admin!

  def search
    @range = params[:range]

    if @range == "UserName"
      @users = User.looks(params[:search], params[:word])
    elsif @range == "GameTitle"
      @games = Game.looks(params[:search], params[:word])
    end
  end
end
