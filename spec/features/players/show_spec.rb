require "rails_helper"

RSpec.describe "players show page" do
  # [ ] done

  # User Story 4, Child Show 
  
  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes
  # (data from each column that is on the child table)
  describe "when I visit players name" do
    it "displays all the attributes for that player" do
      team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)
      player_1 = Player.create!(name: "Patrick Mahomes", drafted: true, jersey_num: 15, team_id: 1)
      
      visit "/players/#{player_1.id}"
      
      expect(page).to have_content(player_1.name)
      expect(page).to have_content(player_1.drafted)
      expect(page).to have_content(player_1.jersey_num)
      expect(page).to have_content(player_1.team_id)
      
    end
  end
  
  # [ ] done
  # User Story 14, Child Update 
  # As a visitor
  # When I visit a Child Show page
  # Then I see a link to update that Child "Update Child"
  # When I click the link
  # I am taken to '/child_table_name/:id/edit' 
  # When I click the button to submit the form "Update Child"
  # Then a `PATCH` request is sent to '/child_table_name/:id',
  # the child's data is updated,
  # and I am redirected to the Child Show page 
  # where I see the Child's updated information
  
  describe "when I visit player show page" do
    describe "#update_button" do
      it "displays a link to update player" do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)
        player_1 = Player.create!(name: "Patrick Mahomes", drafted: true, jersey_num: 15, team_id: 1)
        visit "/players/#{player_1.id}"
        
        expect(page).to have_link("Update Player", href: "/players/#{player_1.id}")
      end
      
      it "takes me to a form to edit thge player" do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)
        player_1 = Player.create!(name: "Patrick Mahomes", drafted: true, jersey_num: 15, team_id: 1)
        
        visit "/players/#{player_1.id}/edit"
        expect(page).to have_selector("form#update_player")
      end

    end
  end
end