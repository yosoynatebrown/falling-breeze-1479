class Garden < ApplicationRecord
  has_many :plots

  def plants
    plots.joins(:plants)
         .select('plants.name')
         .distinct
         .where('plants.days_to_harvest < 100')
  end
end
