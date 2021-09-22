turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
other_garden = Garden.create!(name: 'Main Street Garden', organic: false)

turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
library_garden.plots.create!(number: 2, size: "Small", direction: "South")
other_garden.plots.create!(number: 738, size: "Medium", direction: "West")
