class StaticPagesController < ApplicationController
  # before_action :redirect, only: [:home]

  def index
    @vehicles = Vehicle.all
    if params["vehicle_array"].present?
      render json: {vehicle_array: params["vehicle_array"]}
    end
  end
  
  def search
    @input = params[:address]
    results = Geocoder.search(@input)
    
    @dist = distance(results.first.coordinates[0], results.first.coordinates[1])

    gon.locations = Location.all
    gon.vehicles = Vehicle.all
    
    
  end
  
  def autoFind
    
    @locations = Location.all
    @userLat = params[:userLat]
    @userLng = params[:userLng]
    
    distanceHash = {}
    @locations.each do |location|
      dist = distance([@userLat.to_d, @userLng.to_d], [location.latitude, location.longitude])
      distanceHash[location.id] = dist
    end
    
    result = distanceHash.group_by{|k, v| v}.min_by{|k, v| k}.last[0][0]
    @resultLocation = Location.find(result)
    
  end
  
  
  private
    
    def redirect
      if logged_in? 
        redirect_to index_path
      end
    end

end
