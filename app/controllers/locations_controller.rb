class LocationsController < ApplicationController
  before_action :tripp


  before_action :location, except: [:index, :new, :create]

  def index
  
  	@locations = @tripp.locations
  end

  def show

  end

  def new
  	@location = Location.new
  end

  def create 
  	@location = @tripp.locations.new(location_params)
  	if @location.save
  		redirect_to tripp_location_path(@tripp, @location)
  	else
  		render.new
  	end
  end


  def edit
  end
	

	def update
		if @location.update(location_params)
			redirect_to tripp_location_path(@tripp, @location)
		else
			render :edit
		end
	end

	def destroy
		@location.destroy
		redirect_to tipp_locations_path(@tripp)
	end

	private

		def location_params
				params.require(:location).permit(:name, :category, :cost, :hours)
		end


	def tripp
		@tripp = Tripp.find(params[:tripp_id])
	end

	def location
		@location = @tripp.locations.find(params[:id])
	end
end













