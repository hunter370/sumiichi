class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.integer :tournament_id,   null: false
      t.string :prefecture,       null: false, default: ""
      t.string :team_name,        null: false, default: ""
      t.string :number,           null: false, default: ""
      t.string :grade,            null: false, default: ""
      t.timestamps
    end
  end
end
