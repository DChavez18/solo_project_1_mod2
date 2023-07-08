require "rails_helper"

RSpec.describe "show team attributes" do
  
#   [ ] done

# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)
  
  describe " when I visit '/teams/:id'" do
    it "displays all of the team attributes from the team table" do
      team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true)

      visit "teams/#{team_1.id}"

      expect(page).to have_content(team_1.name)
      expect(page).to have_content(team_1.id)
      expect(page).to have_content(team_1.city)
      expect(page).to have_content(team_1.rank)
      expect(page).to have_content(team_1.stadium)
    end
  end

#   [ ] done
# User Story 5, Parent Children Index 
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)

  describe "when i visit '/teams/:id/players'" do
    it "displays all the player from that team with all their corresponding attributes " do
      team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true)

      player_1 = team_1.players.create!(name: "Patrick Mahomes", drafted: true, jersey_num: 15)
      player_2 = team_1.players.create!(name: "Travis Kelce", drafted: true, jersey_num: 87)

      visit "/teams/#{team_1.id}/players"

      expect(page).to have_content(player_1.name)
      expect(page).to have_content(player_1.drafted)
      expect(page).to have_content(player_1.jersey_num)
      expect(page).to have_content(player_1.team_id)
      expect(page).to have_content(player_2.name)
      expect(page).to have_content(player_2.drafted)
      expect(page).to have_content(player_2.jersey_num)
      expect(page).to have_content(player_2.team_id)
    end
  end

#   [ ] done
# User Story 7, Parent Child Count
# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent
# end