require_relative 'piece.rb'
require_relative 'movementmodules/stepping.rb'


class King < Piece

  include Steppable
  DELTAS = KINGDELTAS

  def initialize(color, board, position)
    super
    @symbol = "K"

  end

  def deltas
    DELTAS
  end

end
