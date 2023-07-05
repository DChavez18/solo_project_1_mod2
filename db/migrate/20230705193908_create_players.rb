class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.integer :team_id
      t.string :name
      t.boolean :drafted
      t.integer :jersey_num

      t.timestamps
    end
  end
end
