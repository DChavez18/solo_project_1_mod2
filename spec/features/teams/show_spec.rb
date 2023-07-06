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

      visit "teams/:id"

      expect(page).to have_content(team_1.name)
      expect(page).to have_content(team_1.id)
      expect(page).to have_content(team_1.city)
      expect(page).to have_content(team_1.rank)
      expect(page).to have_content(team_1.stadium)
    end
  end
end