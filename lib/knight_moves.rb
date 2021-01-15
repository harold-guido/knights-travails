require_relative 'board.rb'
require_relative 'knight.rb'
require_relative 'node.rb'

def knight_moves(start,finish)
  knight = Knight.new(start)
  Node.breadth_first_list_next(knight.root_node)

  path = knight.find_node(finish).list_previous
  puts "You made it in #{path.length-1} moves! Here's your path"
  path.each do |position|
    puts "[#{position[0]},#{position[1]}]"
  end
end
