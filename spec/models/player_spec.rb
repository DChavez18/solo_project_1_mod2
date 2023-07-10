require "rails_helper"

RSpec.describe Player do
  describe "Players" do
    it{ should belong_to(:team) }
  end
end