require_relative 'piece.rb'
require_relative 'movementmodules/sliding.rb'


class Queen < Piece

  include Slideable
  DELTAS = DIADELTAS + STRDELTAS

  def initialize(color, board, position)
    super
    @symbol = "Q"

  end

  def deltas
    DELTAS
  end

end
