require 'byebug'

module Slideable

  DIADELTAS = [[-1,1], [1,1], [-1,-1], [1,-1]]
  STRDELTAS = [[0,1], [-1,0], [1,0], [0,-1]]
  DELTAS = DIADELTAS + STRDELTAS

  def get_paths(start_position)
    possibles = []
    DELTAS.each do |dir|
      # debugger
      paths = [start_position]
      while in_bounds?(paths.last)
        paths << [dir[0] + paths.last[0], dir[1] + paths.last[1]]
      end
      paths.pop
      possibles << paths
    end
    possibles
  end

  def in_bounds?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7)
  end

  def find_path_for_position(start_pos, end_pos)
    get_paths(start_pos).select { |possible| possible.include?(end_pos) }
  end

  def return_path_for_position(start_pos, end_pos)
    return nil if find_path_for_position(start_pos, end_pos).empty?
    path = find_path_for_position(start_pos, end_pos).last

    until path.last == end_pos
      path.pop
    end

    path
  end


end
