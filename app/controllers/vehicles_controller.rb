class VehiclesController < ApplicationController
  before_action :admin_maintain, only: [:edit, :update, :create, :new, :destroy]
  
  def show
    @vehicle = Vehicle.find(params[:id])
  end
  
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
  
  def edit
    @vehicle = Vehicle.find(params[:id])
  end
  
  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update_attributes(vel_params)
      flash[:success] = "The information of this vehicle is updated!"
      redirect_to @vehicle
    else
      render 'edit'
    end
  end
  
  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    flash[:success] = "Vehicle is deleted successfully!"
    redirect_back(fallback_location: root_path)
  end
  
  
  
  private
    def vel_params
       params.require(:vehicle).permit(:name,:detail,:price,:location)
    end
  
    def admin_maintain
      if logged_in?
        if !(current_user.isadmin == 1)
          flash[:danger] = "Warning: You don't have access!"
          redirect_to root_path
        end
      else
        flash[:danger] = "Please login first!"
        redirect_to root_path
      end
    end
  

    
end
