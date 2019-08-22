require_relative 'bike'

class DockingStation

  def initialize
    @bike_array = []
  end

  attr_reader :bike_array

  def release_bike
    fail 'No bikes available' if @bike_array.empty?
    @bike_array.pop
    "Here is a bike"
  end

  def dock(bike)
    fail 'Station Full!' if @bike_array.length >= 20
    @bike_array << bike
    return "You have docked your bike"
  end

end
