#ALL MOVE VECTORS FOR KNIGHT
$moves = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]

class Board
  def initialize()
    @positions = []
    8.times do |x|
      8.times do |y|
        @positions << [x,y]
      end
    end
    @available_positions = @positions
  end

  def available?(position)
    @available_positions.include?(position) ? true : false
  end
end

class Knight 
end

def knight_moves(start,finish)
end
