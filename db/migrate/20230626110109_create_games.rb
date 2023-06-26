class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :tournament_id,   null: false, default: ""
      t.date :date,               null: false, default: ""
      t.string :order,            null: false, default: ""
      t.string :round,            null: false, default: ""
      t.integer :score,           null: false, default: ""
      t.timestamps
    end
  end
end
