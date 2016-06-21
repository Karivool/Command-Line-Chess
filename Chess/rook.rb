require_relative 'piece.rb'
require_relative 'movementmodules/sliding.rb'



class Rook < Piece

  include Slideable
  deltas = STRDELTAS

  def initialize(color, board, position)
    super
    @symbol = "r"

  end

end
