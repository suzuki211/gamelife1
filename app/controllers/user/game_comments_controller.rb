class User::GameCommentsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    comment = current_user.game_comments.new(game_comment_params)
    comment.game_id = game.id
    comment.save
  end

  def destroy
  end

  private

  def game_comment_params
    params.require(:game_comment).permit(:comment, :game_id, :user_id)
  end
end