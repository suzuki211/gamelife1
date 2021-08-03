class Game < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :tags, dependent: :destroy
  has_many :game_comments, dependent: :destroy
  attachment :image
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :impressions, presence: true
  validates :evaluation, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @game = Game.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @game = Game.where("title LIKE?","#{word}%")
    elsif search == "partial_match"
      @game = Game.where("title LIKE?","%#{word}%")
    else
      @game = Game.all
    end
  end
end
