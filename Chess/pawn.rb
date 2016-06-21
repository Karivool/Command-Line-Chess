require_relative 'piece.rb'
require_relative 'movementmodules/advanceable.rb'

class Pawn < Piece

include Advanceable

def initialize(color, board, position)
  super
  @symbol = "p"
  @moved = false
end

def deltas
  @color == :red ? [0,-1] : [0,1]
end

def update_position(pos)
  @moved = true
  super
end

end
