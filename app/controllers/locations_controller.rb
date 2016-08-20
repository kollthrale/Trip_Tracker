class LocationsController < ApplicationController
  
  def show
  	@tripp = Tripp.find(params[:tripp_id])
  	@location = @tripp.locations.find(params[:id])
  end

  def new
  	@tripp = Tripp.find(params[:tripp_id])
  	@location = Location.new
  end

  def create
  	@tripp = Tripp.find(params[:tripp_id])
  	@location = @tripp.locations.new(location_params)
  	if @location.save 
  		redirect_to tripp_location_path(@tripp, @location)
  	else 
  		render :new 
  	end
  end

  def edit
  	@tripp = Tripp.find(params[:tripp_id])
  	@location = @tripp.locations.find(params[:id])
  end
	

	def update
		@tripp = Tripp.find(params[:tripp_id])
		@location = @tripp.locations.find(params[:id])
		if @location.update(location_params)
			redirect_to tripp_location_path(@tripp, @location)
		else
			render :edit
		end
	end

	def destroy
		@tripp = Tripp.find(params[:tripp_id])
		@location = @tripp.locations.find(params[:id])
		@location.destroy
		redirect_to tripp_path(@tripp)
	end

	private
		def location_params

			params.require(:location).permit(:name, :category, :cost, :hours)
		end
end













