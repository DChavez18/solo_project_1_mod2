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
end
