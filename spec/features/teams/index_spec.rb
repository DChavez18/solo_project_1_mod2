require "rails_helper"

RSpec.describe "team show page" do

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
end