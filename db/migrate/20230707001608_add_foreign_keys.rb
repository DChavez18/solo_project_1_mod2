class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :players, :teams, column: :team_id
  end
end
