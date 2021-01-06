require './lib/knights_travails'

describe Knight do
  describe "#moves" do
    it "returns an array" do
      knight = Knight.new
      expect(knight.moves([2,3],[2,5]).is_a?(Array)).to eql(true)
    end

    it "works out the shortest number of moves the knight takes form one space to another" do
      knight = Knight.new
      expect(knight.moves([3,3], [4,3])).to eql([[3,3],[4,5],[2,4],[4,3]])
    end
  end
end
