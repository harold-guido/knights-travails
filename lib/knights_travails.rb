$moves = {2 => [1,-1], -2 => [1,-1], 1 => [2,-2], -1 => [2,-2]}

class Knight

  #POSSIBLE MOVES BY THE KNIGHT

  def initialize(position)
    @root_position = KnightPositionNode.new(position)
  end

  def make_linked_array_list(node = @root_position)

  end

  def moves_to(finish, position_node = @root_position, shortest_path = [], path = [])
    if position_node.position == finish
      [finish]
    elsif position_node.position == [nil] then
      [nil]
    else
      position_node.next_positions.each do |next_position_node|

        path << position_node.position
        path += moves_to(finish, next_position_node)

        if shortest_path.length == 0 || path.length < shortest_path.length then
          shortest_path = path unless shortest_path[-1] == [nil]
        end
      end
      shortest_path
    end
  end
end

class KnightPositionNode
  attr_accessor :position, :next_positions

  def initialize(position, next_positions = find_next_positions(position))
    @position = position
    @next_positions = next_positions
  end

  def find_next_positions(position, 
                          previous_positions = [position], 
                          restart_previous_positions = true, 
                          next_positions = [])

    $moves.each do |move_x, key|
      key.each do |move_y|
        new_x = position[0] + move_x
        new_y = position[1] + move_y

        if new_x.between?(0,7) && new_y.between?(0,7) && !previous_positions.include?([new_x,new_y]) then
          previous_positions << [new_x,new_y]
          next_positions << KnightPositionNode.new([new_x,new_y], find_next_positions([new_x,new_y],
                                                                        previous_positions,
                                                                        false))
          
          restart_previous_positions == true ? previous_positions = [] : previous_positions
        end
      end
    end
    next_positions.length == 0 ? (return [nil]) : (return next_positions)
  end
end


def knight_moves(start, finish)
  knight = Knight.new(start)
  paths_to_finish = knight.moves_to(finish)
end
