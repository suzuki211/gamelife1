class User::GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user_user.id
    @game.save
    redirect_to user_games_path
  end

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @game_comment = GameComment.new
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to user_games_path
  end

  private

  def game_params
    params.require(:game).permit(:title, :image, :impressions, :genre_id)
  end
end
