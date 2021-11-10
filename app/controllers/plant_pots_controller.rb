class PlantPotsController < ApplicationController
  def destroy
     PlantPlot.find_by(plot_id: params[:id], plant_id: params[:plant_id]).destroy
      
      redirect_to plots_path
  end
end