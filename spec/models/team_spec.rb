require "rails_helper"

RSpec.describe Team do
  describe "Teams" do
    it{ should have_many(:players) }
  end
end