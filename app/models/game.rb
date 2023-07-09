class Game < ApplicationRecord
  belongs_to :tournament
  has_many :game_teams
  has_many :teams, through: :game_teams
  has_many :supports, dependent: :destroy

  
  validates :date, presence: true
  
end
