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
      qb = Player.create!(name: "Patrick Mahomes", team)
    end
  end
end