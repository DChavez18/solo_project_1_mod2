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
      player_1 = Player.create!(name: "Patrick Mahomes", drafted: true, jersey_num: 15, team_id: 1)

      visit "/players"

      expect(page).to have_content(player_1.name)
      expect(page).to have_content(player_1.drafted)
      expect(page).to have_content(player_1.jersey_num)
      expect(page).to have_content(player_1.team_id)
    end
  end

# [ ] done
# User Story 8, Child Index Link
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index

  describe "When I visit any page on the site" do
    describe "team page" do
      it "has a link that connects to the players index" do

        visit "/teams"
        expect(page). to have_link("Player Index", href: "/players")
      end
    end

    describe "welcome page" do
      it "has a link that connects to the players index" do

        visit "/"
        expect(page).to have_link("Player Index", href: "/players")
      end
    end

    describe "player show page" do
      it "has a link that connects to the players index" do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)
        player_1 = Player.create!(name: "Patrick Mahomes", drafted: true, jersey_num: 15, team_id: 1)

        visit "/players/#{player_1.id}"
        expect(page).to have_link("Player Index", href: "/players")
      end
    end

    describe "team show page" do
      it "has a link taht connects to the players index" do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)

        visit "/teams/#{team_1.id}"
        expect(page).to have_link("Player Index", href: "/players")
      end
    end

    describe "team_player page" do
      it "has a link to the player index" do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)
        player_1 = Player.create!(name: "Patrick Mahomes", drafted: true, jersey_num: 15, team_id: 1)
        
        visit "/teams/#{team_1.id}/players"
        expect(page).to have_link("Player Index", href: "/players")
      end
    end
  end
  # [ ] done
  # User Story 15, Child Index only shows `true` Records 
  # As a visitor
  # When I visit the child index
  # Then I only see records where the boolean column is `true`
  
  describe "when i visit the player index" do
    it "only displays records where drafted column is true" do
      team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)
      player_1 = Player.create!(name: "Patrick Mahomes", drafted: true, jersey_num: 15, team_id: 1)
      player_1 = Player.create!(name: "Matrick Pahomes", drafted: false, jersey_num: 18, team_id: 1)
      
      visit "/players"
      
      expect(page).to have_content("Patrick Mahomes")
      expect(page).not_to have_content("Matrick Pahomes")
    end
  end
  
  #[ ] done
  # User Story 18, Child Update From Childs Index Page 
  # As a visitor
  # When I visit the `child_table_name` index page 
  # or a parent `child_table_name` index page
  # Next to every child, I see a link to edit that child's info
  # When I click the link
  # I should be taken to that `child_table_name` edit page 
  # where I can update its information just like in User Story 14
  
  describe "when I visit the player index" do
    it " has an edit link next to every player" do
      team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)
      player_1 = Player.create!(name: "Patrick Mahomes", drafted: true, jersey_num: 15, team_id: 1)
      
      visit "/players"
      
      expect(page).to have_link("Edit", href: "/players/#{player_1.id}/edit")
    end
    
    it "takes me to the player edit page" do
      team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)
      player_1 = Player.create!(name: "Patrick Mahomes", drafted: true, jersey_num: 15, team_id: 1)

      visit "/players"

      click_link "Edit"

      expect(current_path).to eq(edit_player_path(player_1))  
    end

    it "updates the player info when new info is filled in" do
      team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)
      player_1 = Player.create!(name: "Patrick Mahomes", drafted: true, jersey_num: 15, team_id: 1)

      visit "/players"

      click_link "Edit"

      fill_in "player_name", with: "Pat MCDonald"
      check "player_drafted"
      fill_in "player_jersey", with: 88

      click_button "player_submit"

      expect(current_path).to eq(update_player_path(player_1))
      expect(page).to have_content("Pat MCDonald")
      expect(page).to have_content("true")
      expect(page).to have_content(88)
    end
  end
end

