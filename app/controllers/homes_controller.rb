class HomesController < ApplicationController
  def top
    @games = Game.all.order(created_at: :desc).limit(4)
  end
end
