class Game < ApplicationRecord
  belongs_to :user
  has_many :_comments, dependent: :destroy
  attachment :image 
end
