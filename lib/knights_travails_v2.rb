#ALL MOVE VECTORS FOR KNIGHT
class Board
  def initialize()
    @positions = []
    8.times do |x|
      8.times do |y|
        @positions << [x,y]
      end
    end
    @available_positions = @positions
    @taken_positions = []
  end

  def available?(position)
    @available_positions.include?(position) ? true : false
  end

  def place_knight(position)
    @available_positions.include?(position) ? 
      @taken_positions << @available_positions.delete(position) : nil
  end

  def remove_knight(position = "all")
    if position == "all" then
      @taken_positions = []
      @available_positions = @positions
    else
      @taken_positions.include?(position) ?
      @available_positions << @taken_positions.delete(position) : nil
    end
  end
end

class Knight < Board 
  attr_accessor :root_position

  @@MOVES = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]
  @@BOARD = Board.new
  
  def initialize(position)
    @root_position = 
  end
end

class Node
end

def knight_moves
end
