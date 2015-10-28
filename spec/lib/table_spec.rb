require 'table'
require 'pry'

describe Table  do
  let(:table) { described_class.new }

  it "has a size of 5x5 units" do
    expect(table.size).to eq('5x5')
  end

  describe "#place" do
    context "for a 5 unit x 5 unit sized table" do
      it "allows valid placement" do
        table.place(0,0)
        expect(table.position).to eq({x: 0, y: 0})

        table.place(2,4)
        expect(table.position).to eq({x: 2, y: 4})

        table.place(5,3)
        expect(table.position).to eq({x: 5, y: 3})
      end

      it "ignores invalid placement" do
        expect(table.place(-1, 3)).to eq("Please use a valid position")
        expect(table.place(0, 6)).to eq("Please use a valid position")
        expect(table.place(5, 33)).to eq("Please use a valid position")
      end
    end
  end
end
