require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end
  before(:each) do
    @library_garden = Garden.create!(name: 'Public Library Garden', organic: true)

    @plot_1 = @library_garden.plots.create!(number: 1, size: "Large", direction: "East")
    @plot_2 = @library_garden.plots.create!(number: 2, size: "Small", direction: "West")

    @plant_1 = @plot_1.plants.create!(name: "Marigolds", description: "Really gold and stuff", days_to_harvest: 90)
    @plant_2 = @plot_1.plants.create!(name: "Sunflower", description: "Yellow. Some might say Sun-like", days_to_harvest: 75)
    
    @plant_3 = @plot_2.plants.create!(name: "Raspberry Bush", description: "Big and thorny", days_to_harvest: 60)
    @plant_4 = @plot_2.plants.create!(name: "Watermelon", description: "Juicy like that Juicy Fruit (TM)", days_to_harvest: 45)
    @plant_5 = @plot_2.plants.create!(name: "Banana Tree", description: "Curvy", days_to_harvest: 101)

    @plant_6 = Plant.create!(name: "Cherry Tree", description: "Tiny red fruit", days_to_harvest: 45)


    @plot_2.plants << @plant_1
  end

  describe '#plants' do
    it 'should provide plants in garden without duplicates and harvest less than 100 days' do
      expect(@library_garden.plants).to include(@plant_2, @plant_3, @plant_4)
      expect(@library_garden.plants.count(@plant_1)).to eq(1)
      expect(@library_garden.plants).not_to include(@plant_5)
      expect(@library_garden.plants).not_to include(@plant_6)
    end
  end
end
