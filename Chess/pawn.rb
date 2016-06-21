require_relative 'piece.rb'
require_relative 'movementmodules/sliding.rb'

class Pawn < Piece


def initialize(color, board, position)
  super
  @symbol = "p"

end

end
