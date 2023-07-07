class AddTeamIdToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_reference :players, :teams, null: true, foreign_key: true
  end
end
