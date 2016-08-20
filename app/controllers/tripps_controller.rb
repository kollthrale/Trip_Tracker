class TrippsController < ApplicationController

  def index
  	@tripps = Tripp.all
  end

  def show
  	@tripp = Tripp.find(params[:id])
  end

  def new
  	@tripp = Tripp.new
  end

	def create
		@tripp = Tripp.new(tripp_params)
		if @tripp.save
			redirect_to tripp_path(@tripp)
		else
			render :new
		end
	end

	def edit
		@tripp = Tripp.find(params[:id])
 	end

	def update
		@tripp = Tripp.find(params[:id])
		if @tripp.update(tripp_params)

			redirect_to tripp_path(@tripp)
		else
			render :edit
		end
	end

	def destroy
		@tripp = Tripp.find(params[:id])
		@tripp.destroy
		redirect_to tripps_path
	end

	def tripp_params
		params.require(:tripp).permit(:name, :vacation, :date, :duration)
	end


end