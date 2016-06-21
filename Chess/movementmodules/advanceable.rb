require 'byebug'

module Advanceable

def get_paths(start_position, end_position)

  moves = [[deltas[0] + start_position[0], deltas[1] + start_position[1]]]

  unless @moved || !is_not_blocked?(moves.first)
    moves << [deltas[0] + start_position[0], (deltas[1] * 2) + start_position[1]]
  end

  moves.select do |possible|
    possible == end_position &&
    is_not_blocked?(end_position) &&
    in_bounds?(end_position)
  end
end

def is_not_blocked?(next_pos)
  @board[next_pos].nil?
end

def in_bounds?(pos)
  pos[0].between?(0, 7) && pos[1].between?(0, 7)
end


end
