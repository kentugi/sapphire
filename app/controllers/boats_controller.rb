class BoatsController < ApplicationController
  def allboats
  end

  def show
    @boat = Boat.find(params[:id])
  end

end
