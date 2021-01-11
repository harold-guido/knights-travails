$moves = {2 => [1,-1], -2 => [1,-1], 1 => [2,-2], -1 => [2,-2]}

class Knight

  #POSSIBLE MOVES BY THE KNIGHT

  def initialize(position)
    @root_position = KnightPositionNode.new(position)
  end

  def moves_to(finish, position_node = @root_position, shortest_path = [], path = [])
    p position_node
    if position_node.next_positions == nil then
      [nil]
    elsif position_node.position == finish
      finish
    else

      position_node.next_positions.each do |next_position_node|
        p next_position_node

        path << position_node.position
        path << moves_to(finish, next_position_node)

        found_finish = path[-1] != [nil]
        no_shortest_path = shortest_path.length == 0
        new_shortest_path = path.length < shortest_path.length

        if (no_shortest_path || new_shortest_path) && found_finish then
          shortest_path = path
          path = []
        else
          path = []
        end
      end
      shortest_path

    end
  end
end

class KnightPositionNode
  attr_accessor :position, :next_positions

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
        if new_x.between?(0,8) && new_y.between?(0,8) && !previous_positions.include?([new_x,new_y]) then
          next_positions.push(KnightPositionNode.new([new_x,new_y], previous_positions))
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
  paths_to_finish = knight.moves_to(finish)
end
