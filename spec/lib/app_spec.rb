require 'app'


describe App do
  let(:app) { described_class.new }
  let(:report) { {command: :report} }
  let(:starting_position) {
    {command: :place, x: 0, y: 0, orientation: :north}
  }

  let(:left) { {command: :left} }
  let(:right) { {command: :right} }
  let(:move) { {command: :move} }

  describe "#execute" do
    # potentially a bad idea to rely on the report method to verify functionality...
    context "with a robot on the table" do
      before(:each) do
        app.execute(starting_position)
      end

      context "when given a place command" do
        let(:command) {
          {command: :place, x: 0, y: 4, orientation: :west}
        }
        it "places the robot at the given position, with the correct orientation" do
          app.execute(command)
          expect(app.execute(report)).to eq("0,4,WEST")
        end
      end

      context "when given a report command" do
        it "reports the current position of the robot" do
          expect(app.execute(report)).to eq("0,0,NORTH")
        end
      end

      context "when given a move command" do
        it "moves the robot one unit forward in the direction it's facing" do
          app.execute(move)
          expect(app.execute(report)).to eq("0,1,NORTH")
        end
      end

      context "when given a left command" do
        it "changes the orientation of the robot 90degrees to the left" do
          app.execute(left)
          expect(app.execute(report)).to eq("0,0,WEST")
        end
      end

      context "when given a right command" do
        it "changes the orientation of the robot 90degrees to the right" do
          app.execute(right)
          expect(app.execute(report)).to eq("0,0,EAST")
        end
      end

      context "when attempting to move the robot off the table" do
        it "ignores the command" do
          app.execute(left)
          app.execute(move)
          expect(app.execute(report)).to eq("0,0,WEST")

          app.execute(left)
          app.execute(move)
          app.execute(move)
          app.execute(move)
          expect(app.execute(report)).to eq("0,0,SOUTH")
        end
      end
    end

    context "with a robot not placed on the table" do
      context "when given a place command" do
        let(:command) {
          {command: :place, x: 0, y: 0, orientation: :north}
        }

        it "places the robot at the given position, with the correct orientation" do
          app.execute(command)
          expect(app.execute(report)).to eq("0,0,NORTH")
        end
      end

      context "when given a report command" do
        it "raises an error" do
          expect(app.execute(report)).to eq("Robot has yet to be placed on the table")
        end
      end

      context "when given a move command" do
        it "raises an error" do
          expect(app.execute(move)).to eq("Robot has yet to be placed on the table")
        end
      end

      context "when given a left command" do
        it "raises an error" do
          expect(app.execute(left)).to eq("Robot has yet to be placed on the table")
        end
      end

      context "when given a right command" do
        it "raises an error" do
          expect(app.execute(right)).to eq("Robot has yet to be placed on the table")
        end
      end
    end
  end
end
