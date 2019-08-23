class Bike

  def initialize
    @is_working = true
  end

  def working?
    @is_working
  end

  def report
    @is_working = false
  end

end
