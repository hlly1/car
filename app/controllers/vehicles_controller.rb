class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vel_params)
    # @vehicle.location_id = params[:vehicle][:location_id]
    if @vehicle.save
      # Add new vehicle successfully
      flash[:success] = "New vehicle is added at that location!"
      redirect_to locations_url
    else
      render 'new'
    end
  end
  
  
  
  
  private
    def vel_params
       params.require(:vehicle).permit(:name,:detail,:price,:location_id)
    end
  
  
  
end
