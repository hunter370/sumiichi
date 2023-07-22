class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :tournament_id,   null: false
      t.date :date, null: false
      t.string :order, null: false
      t.string :round, null: false
      t.string :score, null: false
      t.timestamps
    end
  end
end
