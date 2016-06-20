class Display
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def render
    board.grid
  end

end
