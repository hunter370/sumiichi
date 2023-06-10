class Admin::TournamentTeamsController < ApplicationController
  belongs_to :team
  belongs_to :tournament
end
