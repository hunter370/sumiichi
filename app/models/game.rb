class Game < ApplicationRecord
  belongs_to :tournament
  has_many :game_teams
  has_many :teams, through: :game_teams
end
