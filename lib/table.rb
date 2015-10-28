class Table
  attr_accessor :width, :height, :position

  def initialize(width: 5, height: 5)
    @width = width
    @height = height
  end

  def size
    "#{width}x#{height}"
  end

  def place(x, y)
    return "Please use a valid position" if !valid_position?(x,y)
    self.position = {x: x, y: y}
  end

  def position_set?
    !!self.position
  end

  private

  def valid_position?(x, y)
    x >= 0 && y >=0 && x <= width && y <= height
  end
end
