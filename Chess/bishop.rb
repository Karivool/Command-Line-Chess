require_relative 'piece.rb'
require_relative 'movementmodules/sliding.rb'


class Bishop < Piece

  include Slideable
  DELTAS = DIADELTAS

  def initialize(color, board, position)
    super
    @symbol = "b"

  end

  def deltas
    DELTAS
  end

end
