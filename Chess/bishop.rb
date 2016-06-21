require_relative 'piece.rb'
require_relative 'movementmodules/sliding.rb'


class Bishop < Piece

  include Slideable
  deltas = DIADELTAS

  def initialize(color, board, position)
    super
    @symbol = "b"

  end

end
