require 'rails_helper'

RSpec.describe 'Garden show page' do
    before(:each) do
      @library_garden = Garden.create!(name: 'Public Library Garden', organic: true)

      @plot_1 = @library_garden.plots.create!(number: 1, size: "Large", direction: "East")
      @plot_2 = @library_garden.plots.create!(number: 2, size: "Small", direction: "West")

      @plant_1 = @plot_1.plants.create!(name: "Marigolds", description: "Really gold and stuff", days_to_harvest: 90)
      @plant_2 = @plot_1.plants.create!(name: "Sunflower", description: "Yellow. Some might say Sun-like", days_to_harvest: 75)
      
      @plant_3 = @plot_2.plants.create!(name: "Raspberry Bush", description: "Big and thorny", days_to_harvest: 60)
      @plant_4 = @plot_2.plants.create!(name: "Watermelon", description: "Juicy like that Juicy Fruit (TM)", days_to_harvest: 45)
      @plant_5 = @plot_2.plants.create!(name: "Banana Tree", description: "Curvy", days_to_harvest: 101)

      @plot_2.plants << @plant_1

      visit "/gardens/#{@library_garden.id}"
    end

    it "should have a list of plants that are included in the garden's plots" do
      expect(page).to have_content(@plant_2.name)

      expect(page).to have_content(@plant_3.name)
      expect(page).to have_content(@plant_4.name)
    end

    it "should not have any duplicate plants" do
      expect(page).to have_content(@plant_1.name, count: 1)
    end

    it "should only have plants that take less than 100 days to harvest" do
      expect(page).not_to have_content(@plant_5.name)
    end
end