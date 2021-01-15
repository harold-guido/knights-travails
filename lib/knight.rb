class Knight < Board 
  attr_accessor :root_node, :next_positions

  @@MOVES = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]
  @@BOARD = Board.new()

  def initialize(position)
    @root_node = Node.new(position)
  end

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
