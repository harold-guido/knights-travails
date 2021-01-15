#ALL MOVE VECTORS FOR KNIGHT
class Board
  attr_accessor :available_positions, :positions
  def initialize()
    @POSITIONS = create_board()
    @available_positions = @POSITIONS
    @taken_positions = []
  end

  def create_board(board = [])
    8.times do |x|
      8.times do |y|
        board << [x,y]
      end
    end
    board
  end

  def available?(position)
    @available_positions.include?(position) ? true : false
  end

  def place_knight(position)
    @available_positions.delete(position)
  end

  def clear()
    @available_positions = @POSITIONS
  end
end

class Knight < Board 
  attr_accessor :root_node, :next_positions

  @@MOVES = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]
  @@BOARD = Board.new()

  def initialize(position)
    @root_node = Node.new(position)
  end

  #FIND FINISH NODE USING BREADTH FIRST SEARCH
  def find_node(finish, node_queue = [@root_node], next_queue = [])
    node_queue.each do |node|
      if node.position == finish
        return node
      else
        next_queue += node.next_positions unless node.next_positions == nil
      end
    end

    next_queue.length == 0 ? return : find_node(finish, next_queue)
  end
end

class Node < Knight
  attr_accessor :position, :next_positions

  def initialize(position, previous_position = nil, next_positions = nil)
    @previous_position = previous_position
    @position = position
    @next_positions = next_positions
  end

  def self.breadth_first_list_next(node_queue, next_queue = [])
    if node_queue.is_a?(Node)
      @@BOARD = Board.new()
      node_queue.list_next()

      next_queue = node_queue.next_positions
      breadth_first_list_next(next_queue)
    else
      node_queue.each do |node|
        node.list_next()

        next_queue += node.next_positions unless node.next_positions == nil
      end

      if next_queue.length != 0
        breadth_first_list_next(next_queue)
      end
    end
  end

  def list_next(next_positions = [])
    @@MOVES.each do |move|
      new_x = self.position[0] + move[0]
      new_y = self.position[1] + move[1]

      if @@BOARD.available?([new_x,new_y]) then
        @@BOARD.place_knight([new_x,new_y])
        next_positions.push([new_x,new_y])
      end
    end

    if next_positions.length != 0 then
      self.next_positions = next_positions.map{ |position| Node.new(position, self) }
    else
      self.next_positions = nil
    end
  end

  def list_previous(previous_positions = [])
    if @previous_position == nil then
      [@position]
    else
      previous_position = [@position] 
      previous_position = @previous_position.list_previous + previous_position
    end
  end

  def self.next_positions_array(node_array, return_array = [])
    if node_array == nil
      return_array = nil
    else
      node_array.each{ |node| return_array.push(node.position) } unless @next_positions == nil
    end
    return_array
  end
end

def knight_moves(start,finish)
  knight = Knight.new(start)
  Node.breadth_first_list_next(knight.root_node)

  return knight.find_node(finish).list_previous
end
