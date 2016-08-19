class AddressesController < ApplicationController
  before_action :location


  before_action :address, except: [:index, :new, :create]

  def index
  
  	@adresses = @location.addresses
  end

  def show

  end

  def new
  	@address = Adress.new
  end

  def create 
  	@address = @location.addresses.new(address_params)
  	if @address.save
  		redirect_to location_address_path(@location, @address)
  	else
  		render.new
  	end
  end


  def edit
  end
	

	def update
		if @address.update(address_params)
			redirect_to location_address_path(@location, @address)
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
				params.require(:address).permit(:street, :coty, :state, :zip)
		end


	def location
		@location = Location.find(params[:location_id])
	end

	def address
		@address = @location.addresses.find(params[:id])
	end
end
