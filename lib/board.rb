#ALL MOVE VECTORS FOR KNIGHT
class Board
  attr_accessor :available_positions, :positions
  def initialize()
    @POSITIONS = create_board()
    @available_positions = @POSITIONS
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
