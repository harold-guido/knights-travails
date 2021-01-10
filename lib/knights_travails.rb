$moves = {2 => [1,-1], -2 => [1,-1], 1 => [2,-2], -1 => [2,-2]}

class Knight

  #POSSIBLE MOVES BY THE KNIGHT

  def initialize(position)
    @root_position = PositionNode.new(position)
  end
end

class PositionNode < Knight
  attr_accessor :next_positions

  def initialize(position, previous_positions = [])
    @position = position
    @x = position[0]
    @y = position[1]
    @next_positions = find_next_positions(position, previous_positions)
  end

  def find_next_positions(position, previous_positions, next_positions = [])
    previous_positions.push(position)
    $moves.each do |move_x, key|
      key.each do |move_y|
        new_x = @x + move_x
        new_y = @y + move_y
        if new_x.between?(0,8) && new_y.between?(0,8) && !previous_positions.include?([new_x, new_y]) then
          next_positions.push(PositionNode.new([new_x, new_y], previous_positions))
        else
          return nil
        end
      end
    end
    return next_positions
  end
end


def knight_moves(start, finish)
  knight = Knight.new(start)
  knight.moves_to(finish)
end
