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
    @available_positions.delete(position)
  end

  def clear()
    @available_positions = @positions
  end
end

class Knight < Board 
  attr_accessor :root_position, :next_positions

  @@MOVES = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]
  @@BOARD = Board.new

  def initialize(position)
    @root_node = Node.new(position)
    @@BOARD.clear
  end
end

class Node < Knight
  attr_accessor :position, :next_positions

  def initialize(position, previous_position = nil, next_positions = nil)
    @previous_position = previous_position
    @position = position
    @next_positions = next_positions

    self.list_next
  end

  def list_next(next_positions = [])
    @@MOVES.each do |move|
      new_x = @position[0] + move[0]
      new_y = @position[1] + move[1]

      if @@BOARD.available?([new_x,new_y]) then
        @@BOARD.place_knight([new_x,new_y])
        next_positions.push([new_x,new_y])
      end
    end

    if next_positions.length != 0 then
      @next_positions = next_positions.map{ |position| Node.new(position, self) }
    else
      @next_positions = nil
    end
  end

  def list_previous_positions(previous_positions = [])
    if @previous_position == nil then
      [@position]
    else
      previous_position = [@position] 
      previous_position += @previous_position.list_previous_positions
    end
  end

  def next_positions_array()
    return_array = []
    @next_positions.each{ |node| return_array.push(node.position) } unless @next_positions == nil
    return_array
  end
end

def knight_moves(start,finish)
  knight = Knight.new(start)
  knight.bfs(finish).list_previous_positions
end
