require './lib/knights_travails'

describe "#knight_moves" do
  it "returns an array" do
    expect(knight_moves([2,3],[2,5]).is_a?(Array)).to eql(true)
  end

  it "returns the finish position as the last array" do
    expect(knight_moves([3,3],[4,3])[-1]).to eql([4,3])
  end

  it "returns the start position as the first array" do
    expect(kngiht_moves([3,3],[4,3])[0]).to eql([3,3])
  end

  it "returns the shortest path" do
    expect(knight_moves([3,3],[4,3])).to eql([[3,3],[4,5],[2,4],[4,3]])
  end

  #it "" do
  #end

  it "returns an error for positions greater than [8,8]" do
    expect(knight_moves([9,0],[3,4])).to eql("Invalid positions")
  end

  it "returns an error for positions less than [0,0]" do
    expect(knight_moves([-1,0],[3,4])).to eql("Invalid positions")
  end
end

