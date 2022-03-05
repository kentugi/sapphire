class BoatsController < ApplicationController
  def index
    boat_type = params["/boats"][:boat_type]
    if  boat_type.present?
      @results = PgSearch.multisearch(boat_type)
    else
      @results = Boat.all
    end
  end

  def show
    @boat = Boat.find(params[:id])
    @booking = Booking.new
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save!
      redirect_to boat_path(@boat), notice: 'Boat was successfully created.'
    else
      render :new
    end
  end

  # def edit
  # end

  def update
    @boat.update(boat_params)
    redirect_to boats_path(@boat)
  end

  def destroy
    @boat.destroy
    redirect_to boats_path
  end

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:title, :description, :price, :location, :photo, :boat_type)
  end

end
