require "rails_helper"

RSpec.describe Player do
  describe "Players" do
    it{ is_expected.to belong_to(:team) }
  end
end