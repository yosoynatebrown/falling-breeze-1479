class Garden < ApplicationRecord
  has_many :plots

  def plants
    plots.joins(:plants)
         .select('plants.*')
         .distinct
         .where('plants.harvest < 100')
  end
end
