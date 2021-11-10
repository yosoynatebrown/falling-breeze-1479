class Garden < ApplicationRecord
  has_many :plots

  def plants
    plots.joins(:plants)
         .select('plants.name, COUNT(plots.id) AS plot_count')
         .distinct
         .group('plants.id')
         .order(plot_count: :desc)
         .where('plants.days_to_harvest < 100')
  end
end
