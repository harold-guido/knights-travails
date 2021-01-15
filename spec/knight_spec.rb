require './lib/knights_travails'


#TESTS FOR BOARD CLASS
describe Board do
  before(:all) do
    #SETTING NEW BOARD
    @board = Board.new
  end

  describe "#available?" do
    it "returns true for positions inside board" do
      expect(@board.available?([0,0])).to eql(true)
      expect(@board.available?([7,5])).to eql(true)
    end

    it "returns false for positions outside board" do
      expect(@board.available?([-1,5])).to eql(false)
      expect(@board.available?([7,-5])).to eql(false)
      expect(@board.available?([12,5])).to eql(false)
      expect(@board.available?([7,8])).to eql(false)
    end
  end


  describe "#place_knight" do
    it "removes position from available positions" do
      @board.place_knight([2,3])
      @board.place_knight([0,0])
      expect(@board.available?([2,3])).to eql(false)
      expect(@board.available?([0,0])).to eql(false)
    end

    it "does not give an error when the position is not available" do
      @board.place_knight([3,3])
      expect{ @board.place_knight([3,3]) }.not_to raise_error
    end
  end

  describe "#remove_knight" do
    it "removes position from taken positions and adds it to available positions" do
      @board.place_knight([0,0])
      @board.remove_knight([0,0])
      expect(@board.available?([0,0])).to eql(true)
    end

    it "does not give an error when the position is already available" do
      expect{ @board.remove_knight }
    end
  end
end

#TESTS FOR KNIGHT CLASS
describe Knight do
  describe "#find_node" do
    before(:each) do
      @knight = Knight.new([3,3])
      Node.breadth_first_list_next(@knight.root_node)
    end

    it "returns a node" do
      expect(@knight.find_node([4,3]).class).to eql(Node)
    end

    it "returns the right node" do
      expect(@knight.find_node([4,3]).position).to eql([4,3])
    end
  end
end

describe Node do
  describe "#bf_next_list" do
    before(:all) do
      @knight = Knight.new([3,3])
    end

    it "does not raise an error" do
      expect{ Node.breadth_first_list_next(@knight.root_position) }.to raise_error
    end

    it "creates lists of next nodes for nodes" do
      Node.breadth_first_list_next(@knight.root_node)
      expect(@knight).to eql(Array)
    end
  end

  describe "#list_next" do
    it "does not raise an error" do
      expect{ @knight = Knight.new([3,3]) }.not_to raise_error
    end
  end

  describe "#list_previous" do
    before(:all) do
      @knight = Knight.new([3,3])
      Node.breadth_first_list_next(@knight.root_node)
    end
    it "returns an array of previous positions" do
      expect(@knight.find_node([4,3]).list_previous.class).to eql(Array)
    end
    it "returns the list from start to finish" do
      expect(@knight.find_node([4,3]).list_previous).to eq([[3,3],[4,5],[2,4],[4,3]]).or eq([[3,3],[5,4],[3,5],[4,3]])
    end
  end
end

#TESTS FOR KNIGHT_MOVES METHOD
describe "#knight_moves" do
  it "shortest path from one cell to another" do
    expect(knight_moves([0,0],[7,7])).to eq([[0,0]])
  end
end
