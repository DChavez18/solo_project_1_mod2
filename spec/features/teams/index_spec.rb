require "rails_helper"

RSpec.describe "team index page" do

  # [ ] done
  # # User Story 1, Parent Index 
  # # For each parent table
  # # As a visitor
  # # When I visit '/parents'
  # # Then I see the name of each parent record in the system

  describe "each parent table" do
    describe "when I visit '/teams'" do
      it "shows me the name of each team in the db" do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true)

        visit "/teams"

        expect(page).to have_content(team_1.name)
      end
    end
  end

# [ ] done
# User Story 6, Parent Index sorted by Most Recently Created 
# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
# end

  describe "when I visit team index" do
    it "orders teams by most recently created, and shows when they were created" do
      team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)
      team_2 = Team.create!(name: "Eagles", city: "Philadelphia", rank: 2, stadium: true, id: 2)

      visit "/teams"

      expect(page).to have_content(team_1.name)
      expect(page).to have_content(team_2.name)
      expect(page).to have_content(team_1.created_at)
      expect(page).to have_content(team_2.created_at)
    end
  end

# [ ] done
# User Story 9, Parent Index Link
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index

  describe "when i visit any page on the site" do
    describe "welcome page" do
      it "has a link to the team index" do

        visit "/"
        expect(page).to have_link("Team Index", href: "/teams")
      end
    end

    describe "player page" do
      it "has a link to the team index" do

        visit "/players"
        expect(page).to have_link("Team Index", href: "/teams")
      end
    end

    describe "player show page" do
      it "has a link to the team index" do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)
        player_1 = Player.create!(name: "Patrick Mahomes", drafted: true, jersey_num: 15, team_id: 1)

        visit "/players/#{player_1.id}"
        expect(page).to have_link("Team Index", href: "/teams")
      end
    end

    describe "team show page" do
      it "has a link to the team index" do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)

        visit "/teams/#{team_1.id}"
        expect(page).to have_link("Team Index", href: "/teams")
      end
    end

    describe "team_player page" do
      it "has a link to the team index" do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)
        player_1 = Player.create!(name: "Patrick Mahomes", drafted: true, jersey_num: 15, team_id: 1)

        visit "/teams/#{team_1.id}/players"
        expect(page).to have_link("Team Index", href: "/teams")
      end
    end
  end

#[ ] done

# User Story 11, Parent Creation 

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' 
# where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page,
#  where I see the new Parent displayed.

  describe "when I visit the Team Index Page" do
    describe "New Team button" do
      it "displays a link to create a new Team record" do

        visit "/teams"
        expect(page).to have_link("New Team", href: "/teams/new")
      end

      it "takes me to a new page to fill out a from for a New team" do

        visit "/teams/new"
        expect(page).to have_selector("form#new_team")
      end

      it "creates a new team with attributes when the form is submitted" do
        visit "teams/new"

        fill_in "team_name", with: "Broncos"
        fill_in "team_city", with: "Denver"
        fill_in "team_rank", with: 30
        check "team_stadium"

        click_button "team_submit"

        expect(page).to have_current_path("/teams")
      end

      it "creates and saves the new team and redirects you to the team index page" do
        visit "/teams/new"

        fill_in "team_name", with: "Broncos"
        fill_in "team_city", with: "Denver"
        fill_in "team_rank", with: 30
        check "team_stadium"
      
        click_button "team_submit"
      
        expect(page).to have_current_path("/teams")
      
        new_team = Team.find_by(name: "Broncos")
        expect(new_team).to_not be_nil
      
        expect(page).to have_link("Broncos", href: "/teams/#{new_team.id}")
      end
    end
  end

# [ ] done
# User Story 17, Parent Update From Parent Index Page 
# As a visitor
# When I visit the parent index page
# Next to every parent, I see a link to edit that parent's info
# When I click the link
# I should be taken to that parent's edit page 
# where I can update its information just like in User Story 12

  describe "when i visit team index page" do
    describe "edit info link" do
      it "displays an edit link next to every team" do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)
        visit "/teams"
        
        expect(page).to have_link("Edit", href: "/teams/#{team_1.id}/edit")
      end
      
      it "takes me to the team edit page" do
        team_1 = Team.create!(name: "Chiefs", city: "Kansas City", rank: 1, stadium: true, id: 1)
        visit "/teams"

        click_link "Edit"

        expect(current_path).to eq(edit_team_path(team_1))        
      end
    end
  end
end
      
