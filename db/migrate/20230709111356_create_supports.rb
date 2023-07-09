class CreateSupports < ActiveRecord::Migration[6.1]
  def change
    create_table :supports do |t|
      t.integer :game_id,   null: false, default: ""
      t.integer :user_id,   null: false, default: ""
      t.text :alps_first,   null: false, default: ""
      t.text :alps_third,   null: false, default: ""
      t.text :stand,        null: false, default: ""
      t.timestamps
    end
  end
end
