class Team < ApplicationRecord
  belongs_to :tournament
  has_many :game_teams
  has_many :games, through: :game_teams
end
