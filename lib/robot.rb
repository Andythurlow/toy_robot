class Robot
  attr_accessor :orientation

  def initialize(orientation:)
    @orientation = orientation
  end

  def right
    directions = {
      north: :east,
      east: :south,
      south: :west,
      west: :north
    }

    self.orientation = directions[self.orientation]
  end

  def left
    directions = {
      north: :west,
      west: :south,
      south: :east,
      east: :north
    }

    self.orientation = directions[self.orientation]
  end
end
