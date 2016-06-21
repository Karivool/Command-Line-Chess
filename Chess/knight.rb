require_relative 'piece.rb'
require_relative 'movementmodules/stepping.rb'


class Knight < Piece

  include Steppable
  DELTAS = KNIGHTDELTAS

  def initialize(color, board, position)
    super
    @symbol = "k"

  end

  def deltas
    DELTAS
  end

end
