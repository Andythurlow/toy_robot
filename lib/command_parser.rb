class CommandParser

  def self.parse(user_input)
    input = user_input.strip.split(' ')

    command, args = input.delete(input.first), input

    case command
    when 'PLACE'
      args = args.first.split(',') if args.size == 1

      if args.size != 3 || !valid_orientation?(args[2])
        return "Invalid input: #{user_input}"
      end

      { command: command.downcase.to_sym,
        x: args[0].to_i,
        y: args[1].to_i,
        orientation: args[2].downcase.to_sym
      }
    when 'LEFT', 'RIGHT', 'MOVE', 'REPORT'
      { command: command.downcase.to_sym }
    else
      return "Invalid input: #{user_input}"
    end
  end

  def self.valid_orientation?(orientation)
    ["NORTH", "EAST", "SOUTH", "WEST"].any? {|o| o == orientation}
  end

  def self.valid_command?(command)
    !command.nil? && command.kind_of?(Hash)
  end

end
