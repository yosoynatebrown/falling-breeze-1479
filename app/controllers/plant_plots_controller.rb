class PlantPlotsController < ApplicationController
    def destroy
      PlantPlot.find_by(plot_id: params[:id], plant_id: params[:plant_id]).destroy
      
      redirect_to '/plots'
    end
end