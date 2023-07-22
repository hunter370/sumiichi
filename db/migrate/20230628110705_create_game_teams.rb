class CreateGameTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :game_teams do |t|
      t.integer :team_id,   null: false
      t.integer :game_id,   null: false
      t.boolean :first_base, null: false
      t.timestamps
    end
  end
end
