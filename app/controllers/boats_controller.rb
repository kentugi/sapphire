class BoatsController < ApplicationController
  def allboats
  end

  def show
    @boat = Boat.find
  end

end
