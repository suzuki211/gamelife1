class Game < ApplicationRecord
  belongs_to :user
  has_many :game_comments, dependent: :destroy
  attachment :image
end
