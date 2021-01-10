class Knight
  #POSSIBLE MOVES BY THE KNIGHT
  @@moves = [2 => [1,-1], -2 => [1,-1], 1 => [2,-2], -1 => [2,-2]]

  def initialize(position)
    @root_position = position
  end
end

class PositionNode < Knight
  def initialize(position)
    @position = position
    @x = position[0]
    @y = position[1]
    @next_positions = next_positions(position)
  end

  def next_positions(position, next_positions = [])
    @@moves.each do |move_x, key|
      key.each do |move_y|
        new_x = @x + move_x
        new_y = @y + move_y
        next_positions << PositionNode.new([new_x, new_y])
      end
    end
  end

  end

def knight_moves(start, finish)
  knight = Knight.new(start)
  knight.moves_to(finish)
end
