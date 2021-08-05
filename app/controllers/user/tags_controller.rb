class User::TagsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    tag = current_user_user.tag.build(tag_params)
    tag.game_id = @game.id
    tag.save
  end

  def destroy
    @game = Game.find(params[:game_id])
    Tag.find_by(id: params[:id], game_id: params[:game_id]).destroy
    redirect_to user_game_path(@game.id)
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :game_id, :user_id)
  end
end
