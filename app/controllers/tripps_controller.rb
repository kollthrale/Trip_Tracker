class TrippsController < ApplicationController
  before_action :tripp, except: [:index, :new, :create]

  def index

  	@tripps = Tripp.all
  end

  def show

  end

  def new


  	@tripp = Tripp.new
  end
	def create
		@trip = Tripp.new(tripp_params)
		if @tripp.save

		redirect_to tripp_path(@tripp)
	else
		render :new
	end
end

  def edit


  end
end



def update

	if @tripp.update(tripp_params)

		redirect_to tripp_path(@tripp)
	else
		render :edit
	end
def destroy

	@tripp.destroy
	redirect_to tripps_path
end

def tripp_params

	params.require(:tripp).permit(:name, :vacation, :date, :duration)
end

	def tripp
		@tripp = Tripp.find(params[:id])
	end

end