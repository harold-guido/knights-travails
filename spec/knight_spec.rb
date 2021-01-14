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
  describe "#make_node_array_list" do
    before(:each) do
      @knight = Knight.new([3,3])
    end

    it "returns"
  end
end

describe Node do
  describe "#list_next" do
    it "does not raise an error" do
      expect{ @knight = Knight.new([3,3]) }.not_to raise_error
    end
  end
end

#TESTS FOR KNIGHT_MOVES METHOD
describe "#knight_moves" do
  it "returns an array" do
  end
end
