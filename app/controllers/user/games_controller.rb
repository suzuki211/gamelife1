class User::GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    @game.save
    redirect_to user_games_path
  end

  def index
    @games = Game.all
  end

  def show
  end

  def destroy
  end

  private

  def game_params
    params.require(:game).permit(:title, :image, :impressions, :genre_id)
  end
end
