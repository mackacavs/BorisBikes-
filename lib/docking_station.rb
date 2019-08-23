require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bike_array = []
  end

  attr_reader :capacity


  def release_bike
    fail 'No bikes available' if empty?
      bike_array.pop
      "Here is a bike"
  end

  def dock(bike)
    fail 'Docking Station Full!' if full?
      bike_array << bike
      "You have docked your bike" 
  end
  
  private

  attr_reader :bike_array

  def full?
    bike_array.length >= capacity
  end

  def empty?
    bike_array.empty?
  end

end
