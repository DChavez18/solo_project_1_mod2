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
end
