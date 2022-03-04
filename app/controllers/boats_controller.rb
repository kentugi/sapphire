class BoatsController < ApplicationController
  def index
    boat_type = params[:boat_type]
    @results = PgSearch.multisearch(boat_type)
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)

    if @boat.save
      redirect_to boat_path(@boat), notice: 'Boat was successfully created.'
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   @boat.update(boat_params)
  #   redirect_to boats_path(@boat)
  # end

  def destroy
    @boat.destroy
    redirect_to boats_path
  end

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:title, :description, :price, :location)
  end

end
