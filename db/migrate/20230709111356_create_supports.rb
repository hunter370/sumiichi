class CreateSupports < ActiveRecord::Migration[6.1]
  def change
    create_table :supports do |t|
      t.integer :game_id,   null: false
      t.integer :user_id,   null: false
      t.text :alps_first,   null: false
      t.text :alps_third,   null: false
      t.text :stand,        null: false
      t.timestamps
    end
  end
end
