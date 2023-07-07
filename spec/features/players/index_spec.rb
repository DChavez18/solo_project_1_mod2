require "rails_helper"

RSpec.describe "player index" do
#   [ ] done

# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)
  describe "when I visit '/player'" do
    it "displays all players" do
      team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)
      player = Player.create!(name: "Patrick Mahomes", drafted: true, jersey_num: 15, team_id: 1)

      visit "/players"

      expect(page).to have_content(player.name)
    end
  end
end