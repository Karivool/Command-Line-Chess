require_relative 'piece.rb'
require_relative 'movementmodules/sliding.rb'



class Rook < Piece

  include Slideable
  DELTAS = STRDELTAS

  def initialize(color, board, position)
    super
    @symbol = "r"

  end

  def deltas
    DELTAS
  end

end
