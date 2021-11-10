require 'rails_helper'

RSpec.describe PlantPlot, type: :model do
  describe "relationships" do
    it {should belong_to :plant}
    it {should belong_to :plot}
  end
end