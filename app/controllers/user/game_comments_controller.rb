class User::GameCommentsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    comment = current_user_user.game_comments.build(game_comment_params)
    comment.game_id = @game.id
    comment.save
  end

  def destroy
    @game = Game.find(params[:game_id])
    GameComment.find_by(id: params[:id], game_id: params[:game_id]).destroy
  end

  private

  def game_comment_params
    params.require(:game_comment).permit(:comment, :game_id, :user_id)
  end
end