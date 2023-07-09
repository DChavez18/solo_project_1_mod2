require "rails_helper"

RSpec.describe "show team attributes" do
  
#[ ] done
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

#[ ] done
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

#[ ] done
# User Story 7, Parent Child Count
# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent
# end

  describe "when i visit team show page" do
    it "shows a count of the number of players associated with the team" do
      team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true)
      team_2 = Team.create!(name: "Eagles", city: "Philadelphia", rank: 2, stadium: true)

      player_1 = team_1.players.create!(name: "Patrick Mahomes", drafted: true, jersey_num: 15)
      player_2 = team_1.players.create!(name: "Travis Kelce", drafted: true, jersey_num: 87)
      player_3 = team_2.players.create!(name: "Jalen Hurts", drafted: true, jersey_num: 1)
      player_4 = team_2.players.create!(name: "AJ Brown", drafted: true, jersey_num: 11)

      visit "/teams/#{team_1.id}"

      expect(page).to have_content(team_1.players.count)
    end
  end

# [ ] done
# User Story 10, Parent Child Index Link
# As a visitor
# When I visit a parent show page ('/parents/:id')
# Then I see a link to take me to that parent's `child_table_name` page
#  ('/parents/:id/child_table_name')

  describe "when i visit the team show page" do
    it "has a link to take me to the corresponding team players page" do
      team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true)

      visit "/teams/#{team_1.id}"
      expect(page).to have_link("Team Player", href: team_players_path(team_1))
    end
  end

#[ ] done
# User Story 12, Parent Update 
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' 
# where I see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page,
# where I see the parent's updated info

  describe "when i visit the team show page" do
    describe "update team button" do
      it "displays a link to update team: 'Update Team'" do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true)
        
        visit "/teams/#{team_1.id}"
        expect(page).to have_link("Update Team", href: "/teams/#{team_1.id}/edit")
      end
      
      it "when I click the 'Update Team' button I go to a new page to edit attributes" do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true)
        
        visit "teams/#{team_1.id}/edit"
        expect(page).to have_selector("form#update_team")
      end
      
      it "when changes are made and submit is clicked user is redirected to team_show page to view updated changes" do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true)
        
        visit "teams/#{team_1.id}/edit"
        
        fill_in "team_name", with: "Mahomies"
        fill_in "team_city", with: "KC"
        fill_in "team_rank", with: 3
        check "team_stadium"
        
        click_button "team_submit"
        
        
        expect(page).to have_current_path("/teams/#{team_1.id}")
        expect(page).to have_content("Mahomies")
        expect(page).to have_content("KC")
        expect(page).to have_content(3)
      end
    end
  end
  
  #[ ] done
  # User Story 13, Parent Child Creation 
  # As a visitor
  # When I visit a Parent Children Index page
  # Then I see a link to add a new adoptable child for that parent "Create Child"
  # When I click the link
  # I am taken to '/parents/:parent_id/child_table_name/new' 
  # where I see a form to add a new adoptable child
  # When I fill in the form with the child's attributes:
  # And I click the button "Create Child"
  # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
  # a new child object/row is created for that parent,
  # and I am redirected to the Parent Childs Index page 
  # where I can see the new child listed
  
  describe "when i visit the team player index" do
    describe "create player button" do
      it "displays a link that adds a new player to that team"do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true)
      
        visit "/teams/#{team_1.id}/players"
        expect(page).to have_link("Create Player", href: "/teams/#{team_1.id}/players/new")
      end
    
      it "when the link is clicked, you a redirected to a form page" do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true)

        visit "teams/#{team_1.id}/players/new"
        expect(page).to have_selector("form#new_player")
      end
    end
  end


end
  