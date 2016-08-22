class AddressesController < ApplicationController
  before_action :location
  before_action :address, except: [:index, :new, :create]
  before_action :tripp
  def index
  	@addresses = @location.addresses
  end

  def show
  end

  def new
  	@address = Address.new
  end

  def create
  	@address = Address.new(address_params)
  	if @address.save
  		redirect_to tripp_location_path(@tripp, @location)
  	else
  		render :new
  	end
  end

  def edit
  end


	def update
		if @address.update(address_params)
			redirect_to tripp_location_path(@tripp, @location)
		else
			render :edit
		end
	end

	def destroy
		@address.destroy
		redirect_to location_address_path(@address)
	end

	private

	def address_params
	  params.require(:address).permit(:street, :city, :state, :zip, :location_id)
	end

	def tripp
		@tripp = Tripp.find(params[:tripp_id])
	end

	def location
		@location = Location.find(params[:location_id])
	end

	def address
		@address = Address.find(params[:id])
	end
end
