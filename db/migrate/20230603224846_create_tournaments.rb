class CreateTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.string :tytle,         null: false, default: ""
      t.string :short_tytle,   null: false, default: ""
      t.timestamps
    end
  end
end
