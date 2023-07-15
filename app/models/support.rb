class Support < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_one_attached :icon
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
