class Admin::GamesController < ApplicationController
  before_action :authenticate_admin_admin!
  before_action :set_genres, only: [:new, :edit, :index, :create, :update]

  def new
    @game = Game.new
    @genres = Genre.all
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user_user.id
   if @game.save
      flash[:notice] = '投稿に成功しました.'
      redirect_to user_game_path(@game.id)
   else
      @games = Game.all
      @genres = Genre.all
      render :new
   end
  end

  def index
    @games = Game.page(params[:page]).reverse_order
  end

  def show
    @game = Game.find(params[:id])
    @game_comment = GameComment.new
  end

  def edit
    @game = Game.find(params[:id])
    @genres = Genre.all
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to admin_games_path
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to admin_game_path(@game.id)
      flash[:notice] = '編集に成功しました.'
    else
      @games = Game.all
      @genres = Genre.all
      render :edit
    end
  end


  private

  def game_params
    params.require(:game).permit(:title, :image, :impressions, :genre_id, :evaluation)
  end

  def set_genres
    @genres = Genre.where(name: true)
  end
end
