require './lib/knights_travails_v2'

describe Board do
  before(:all) do
    @board = Board.new
  end

  describe "#available?" do
    it "Returns true for available positions" do
      expect(@board.available?([0,0])).to eql(true)
    end
  end
end

describe Knight do
  before(:all) do
    @knight = Knight.new
  end

  describe "#breadth_first_search" do
    it "returns node" do
      expect(@knight.breadth_first_search([4,3]).class).to eql(Node)
    end

    it "returns node being looked for" do
    end

    it "returns closest node being looked for" do
    end
  end

  describe "#make_node_tree" do
  end
end
