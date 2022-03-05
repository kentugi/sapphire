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
    @boats = Boat.where(id: params[:id])
    @markers = @boats.geocoded.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude,
        info_window: render_to_string(partial: "info_window", locals: { boat: boat }),
        image_url: helpers.asset_url("map-icon.png")
      }
    end
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

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
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
