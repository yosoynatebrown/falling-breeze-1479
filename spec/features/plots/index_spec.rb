require 'rails_helper'

RSpec.describe 'Plots index' do
    before(:each) do
      @turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)

      @plot_1 = @turing_garden.plots.create!(number: 1, size: "Large", direction: "East")
      @plot_2 = @turing_garden.plots.create!(number: 2, size: "Small", direction: "West")
      @plot_3 = @turing_garden.plots.create!(number: 3, size: "Small", direction: "West")
      @plot_4 = @turing_garden.plots.create!(number: 4, size: "Small", direction: "East")
      @plot_18 = @turing_garden.plots.create!(number: 18, size: "Large", direction: "East")

      @plant_1 = @plot_1.plants.create!(name: "Marigolds", description: "Really gold and stuff", days_to_harvest: 90)
      @plant_2 = @plot_1.plants.create!(name: "Sunflower", description: "Yellow. Some might say Sun-like", days_to_harvest: 75)
      
      @plant_3 = @plot_2.plants.create!(name: "Raspberry Bush", description: "Big and thorny", days_to_harvest: 60)
      @plant_4 = @plot_2.plants.create!(name: "Watermelon", description: "Juicy like that Juicy Fruit (TM)", days_to_harvest: 45)

      @plant_5 = @plot_18.plants.create!(name: "Banana", description: "Curvy", days_to_harvest: 180)

      visit '/plots'
    end

    it 'should have a list of all plot numbers' do
      expect(page).to have_content(@plot_1.number)
      expect(page).to have_content(@plot_2.number)
      expect(page).to have_content(@plot_3.number)
      expect(page).to have_content(@plot_4.number)
      expect(page).to have_content(@plot_18.number)
    end

    it 'should have plants listed under their respective plots' do
      within "#plot-#{@plot_1.id}" do 
        expect(page).to have_content(@plant_1.name)
        expect(page).to have_content(@plant_2.name)
      end
      within "#plot-#{@plot_18.id}" do 
        expect(page).to have_content(@plant_5.name)
      end
    end

    it 'should allow visitor to remove plants from plot (without deleting plant object)' do
      within "#plot-#{@plot_2.id}" do 
        click_link "Remove #{@plant_3.name} from Plot ##{@plot_2.number}"
        expect(page).to_not have_content("#{@plant_3.name}")
        expect(@plant_3).to exist
      end
    end
end