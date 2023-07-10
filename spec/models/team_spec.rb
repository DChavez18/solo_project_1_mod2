require "rails_helper"

RSpec.describe Team do
  describe "Teams" do
    it{ is_expected.to have_many(:players) }
  end
end