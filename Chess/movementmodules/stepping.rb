require 'byebug'

module Steppable

  KINGDELTAS = [[-1,1], [1,1], [-1,-1], [1,-1],[0,1], [-1,0], [1,0], [0,-1]]
  KNIGHTDELTAS = [[-1,2], [1,2], [-2,-1], [1,-2],[2,1], [-1,-2], [-2,1], [2,-1]]

  def get_paths(start_position, end_position)
    moves = deltas.collect do |dir|
      [dir[0] + start_position[0], dir[1] + start_position[1]]
    end
    moves.select do |possible|
      possible == end_position &&
      is_not_blocked?(end_position) &&
      in_bounds?(end_position)
    end
  end

  def is_not_blocked?(next_pos)
    @board[next_pos].nil? || @board[next_pos].color != self.color
  end

  def in_bounds?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7)
  end

end
