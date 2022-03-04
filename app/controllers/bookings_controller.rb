class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @boat = Boat.find(params[:boat_id])
    @booking.boat = @boat
    @booking.user = current_user
    @booking.total = (@booking.end_date - @booking.start_date) * @boat.price
    if @booking.save
      flash[:notice] = " Hi, your booking created. Check confirmation status in the dashboard. "
      redirect_to boat_path(@boat)
    else
      render 'boats/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total)
  end

end
