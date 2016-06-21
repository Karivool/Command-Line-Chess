
module Slideable

  DIADELTAS = [[-1,1], [1,1], [-1,-1], [1,-1]]
  STRDELTAS = [[0,1], [-1,0], [1,0], [0,-1]]
  DELTAS = DIADELTAS + STRDELTAS

  def get_paths(start_position)
    possibles = []
    DELTAS.each do |dir|
      paths = [start_position]
      until paths.last.out_of_bounds?
        paths << [dir[0] + paths.last[0], dir[1] + paths.last[1]]
      end
      paths.pop
      possibles << paths
    end
    possibles
  end

  def find_path_for_position(position)
    get_paths(position).select { |possible| possible.include?(position) }
  end

  def return_path_for_position

  end

end
