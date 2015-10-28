require 'command_parser'
require 'pry'

describe CommandParser do

  let(:parser) { described_class }

  context "when given valid placement input" do
    let(:input) { " PLACE   0, 0,  NORTH " }
    it "returns parsed input" do
      expect(parser.parse(input)).to eq({command: :place, x: 0, y: 0, orientation: :north})
    end

    let(:also_valid_input) { "PLACE 2,4,NORTH" }
    it "returns parsed input" do
      expect(parser.parse(also_valid_input)).to eq({command: :place, x: 2, y: 4, orientation: :north})
    end
  end

  context "when given a valid 'move' input" do
    let(:input) { " MOVE " }
    it "returns parsed input" do
      expect(parser.parse(input)).to eq({command: :move})
    end
  end

  context "when given a valid 'left' input" do
    let(:input) { " LEFT " }
    it "returns parsed input" do
      expect(parser.parse(input)).to eq({command: :left})
    end
  end

  context "when given a valid 'right' input" do
    let(:input) { " RIGHT " }
    it "returns parsed input" do
      expect(parser.parse(input)).to eq({command: :right})
    end
  end

  context "when given valid report input" do
    let(:input) { " REPORT " }
    it "returns parsed input" do
      expect(parser.parse(input)).to eq({command: :report})
    end
  end

  context "when given an invalid input" do
    let(:input) { " BZZZ tHIs IS wrong" }
    it "returns an error" do
      expect(parser.parse(input)).to eq("Invalid input: #{input}")
    end
  end

  context "when given invalid orientation" do
    let(:input) { "PLACE 0, 0, 0" }
    it "returns an error" do
      expect(parser.parse(input)).to eq("Invalid input: #{input}")
    end
  end

  context "when given too many arguments" do
    let(:input) { "PLACE 0, 3, 4, NORTH" }

    it "returns an error" do
      expect(parser.parse(input)).to eq("Invalid input: #{input}")
    end
  end
end
