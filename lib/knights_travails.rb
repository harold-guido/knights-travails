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
    @root_position = PositionNode.new(position)
  end

  def make_position_tree(position = @root_position, counter = 0)
    position.list_next_positions()

    if position.next_positions == nil then
      return "Tree complete"
    else
      counter += 1
      unless counter == 6 then
        position.next_positions.each do |position_node|
          make_position_tree(position_node, counter)
        end
      end
    end
  end
end

class PositionNode < Knight
  attr_accessor :position, :next_positions

  def initialize(position, previous_position = nil, next_positions = nil)
    @previous_position = previous_position
    @position = position
    @next_positions = next_positions
  end

  def list_next_positions(next_positions = [], previous_positions = self.list_previous_positions)
    @@MOVES.each do |move|
      new_x = @position[0] + move[0]
      new_y = @position[1] + move[1]

      if @@BOARD.available?([new_x,new_y]) && !previous_positions.include?([new_x,new_y]) then
        next_positions.push([new_x,new_y])
      end
    end

    if next_positions.length < 2 then
      @next_positions = nil
    else
      @next_positions = next_positions.map{ |position| PositionNode.new(position, self) } 
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
end

def knight_moves(start,finish)
  knight = Knight.new(start)
  knight.make_position_tree
end
