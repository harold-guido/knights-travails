require './lib/knights_travails'

describe "#knight_moves" do
  it "returns an array" do
   expect(knight_moves([2,3],[2,5]).is_a?(Array)).to eql(true)
  end

  it "returns the finish position as the last array" do
    (knight_moves([3,3],[4,3])[-1]).to eql([4,3])
  end

  it "returns the start position as the first array" do
    expect(kngiht_moves([3,3],[4,3])[0]).to eql([3,3])
  end

  it "returns the shortest path" do
    expect(knight_moves([3,3],[4,3])).to eql([[3,3],[4,5],[2,4],[4,3]])
  end

  it "returns an error for positions greater than [8,8]" do
   expect(knight_moves([9,0],[3,4])).to eql("Invalid positions")
  end

  it "returns an error for positions less than [0,0]" do
    expect(knight_moves([-1,0],[3,4])).to eql("Invalid positions")
  end
end

describe Knight do
end

describe PositionNode do
  test_node = PositionNode.new([4,4])
  describe "#find_next_positions" do
    it "Returns an array" do
      expect(test_node.next_positions.is_a?(Array)).to eql(true)
    end

    it "Returns an array of PositionNodes" do
      expect(test_node.next_positions[0].is_a?(PositionNode)).to eql(true)
    end 

    it "Returns an array of size 8" do
      expect(test_node.next_positions.length).to eql(8)
    end
  end
end
