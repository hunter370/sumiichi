class CreateTournamentTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :tournament_teams do |t|
      t.integer :team_id,         null: false, default: ""
      t.integer :tournament_id,   null: false, default: ""
      t.timestamps
    end
  end
end
