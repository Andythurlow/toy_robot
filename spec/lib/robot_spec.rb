require 'robot'

describe Robot do
  describe "#left" do
    before(:each) do
      robot.left
    end
    context "when facing NORTH" do
      let(:robot) { described_class.new(orientation: :north) }
      it "faces west" do
        expect(robot.orientation).to eq(:west)
      end
    end
    context "when facing EAST" do
      let(:robot) { described_class.new(orientation: :east) }
      it "faces north" do
        expect(robot.orientation).to eq(:north)
      end
    end
    context "when facing SOUTH" do
      let(:robot) { described_class.new(orientation: :south) }
      it "faces east" do
        expect(robot.orientation).to eq(:east)
      end
    end
    context "when facing WEST" do
      let(:robot) { described_class.new(orientation: :west) }
      it "faces south" do
        expect(robot.orientation).to eq(:south)
      end
    end
  end

  describe "#right" do
    before(:each) do
      robot.right
    end
    context "when facing NORTH" do
      let(:robot) { described_class.new(orientation: :north) }
      it "faces east" do
        expect(robot.orientation).to eq(:east)
      end
    end
    context "when facing EAST" do
      let(:robot) { described_class.new(orientation: :east) }
      it "faces south" do
        expect(robot.orientation).to eq(:south)
      end
    end
    context "when facing SOUTH" do
      let(:robot) { described_class.new(orientation: :south) }
      it "faces west" do
        expect(robot.orientation).to eq(:west)
      end
    end
    context "when facing WEST" do
      let(:robot) { described_class.new(orientation: :west) }
      it "faces north" do
        expect(robot.orientation).to eq(:north)
      end
    end
  end
end

