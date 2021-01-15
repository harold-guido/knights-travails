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
        @next_positions == nil ? @next_positions = [Node.new([new_x,new_y], self)] 
        : @next_positions.push(Node.new([new_x,new_y], self))
      end
    end

    #if next_positions.length != 0 then
      #self.next_positions = next_positions.map{ |position| Node.new(position, self) }
    #else
      #self.next_positions = nil
    #end
  end

  def list_previous(previous_positions = [])
    if @previous_position == nil then
      [@position]
    else
      previous_position = [@position] 
      previous_position = @previous_position.list_previous + previous_position
    end
  end
end
