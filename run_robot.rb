require './lib/command_parser'
require './lib/app'

user_input = ARGF.gets

app = App.new

while user_input
  command = CommandParser.parse(user_input)

  if CommandParser.valid_command?(command)
    execution = app.execute(command)
    puts execution if execution
  else
    puts command
  end

  user_input = ARGF.gets
end
