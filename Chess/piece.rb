class Piece
  attr_reader :color, :board, :position

  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def valid_moves
    (0..7).to_a.product((0..7).to_a)
  end

end
