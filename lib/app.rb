#poorly named... struggled coming up with something better
require_relative 'table'
require_relative 'robot'


class App
  attr_accessor :table, :robot
  def initialize
    @table = Table.new
  end

  def execute(user_commands)
    command, args = user_commands[:command], user_commands.reject{|k,v| k == :command}

    if robot_not_placed?(command)
      return "Robot has yet to be placed on the table"
    end

    args.empty? ? send(command) : send(command, args)
  end

  private

  def place(args)
    x = args[:x]
    y = args[:y]
    orientation = args[:orientation]

    @table.place(x,y)
    @robot = Robot.new(orientation: orientation)
    nil
  end

  def report
    position = @table.position
    orientation = @robot.orientation
    "#{position[:x]},#{position[:y]},#{orientation.to_s.upcase}"
  end

  def left
    @robot.left
    nil
  end

  def right
    @robot.right
    nil
  end

  def move
    position = @table.position

    new_x_position = position[:x] + robot_movement[:x]
    new_y_position = position[:y] + robot_movement[:y]

    @table.place(new_x_position, new_y_position)
    nil
  end

  # Not a huge fan of this, as I didn't think it belonged on the robot class,
  # but maybe it does after seeing it here...
  def robot_movement
    case @robot.orientation
    when :north
      {x: 0, y: 1}
    when :east
      {x: 1, y: 0}
    when :south
      {x: 0, y: -1}
    when :west
      {x: -1, y: 0}
    else
      "Facing unknown direction #{@robot.orientation}"
    end
  end

  def robot_not_placed?(command)
    !@table.position_set? && command != :place
  end
end
