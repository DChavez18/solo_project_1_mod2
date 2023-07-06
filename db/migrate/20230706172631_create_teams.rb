class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.integer :rank
      t.boolean :stadium

      t.timestamps
    end
  end
end
