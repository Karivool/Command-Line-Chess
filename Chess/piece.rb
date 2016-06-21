

class Piece
  attr_reader :color, :board, :position, :symbol

  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
    @symbol = "X"
  end

  def symbol
    @symbol.colorize(self.color)
    # print " ".colorize(:background => :green)
  end

  def valid_moves
    (0..7).to_a.product((0..7).to_a)
  end

end
