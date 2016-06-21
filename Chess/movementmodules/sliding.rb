require 'byebug'

module Slideable

  DIADELTAS = [[-1,1], [1,1], [-1,-1], [1,-1]]
  STRDELTAS = [[0,1], [-1,0], [1,0], [0,-1]]


  def get_paths(start_position, end_position)
    possibles = []

    deltas.each do |dir|
      enemy_piece_taken = false
      # debugger
      paths = [start_position]
      next_pos = [dir[0] + paths.last[0], dir[1] + paths.last[1]]

      while in_bounds?(next_pos) && is_not_blocked?(next_pos)
        paths << next_pos
        break if next_pos == end_position || enemy?(next_pos)
        next_pos = [dir[0] + paths.last[0], dir[1] + paths.last[1]]
      end

      possibles << paths

    end

    possibles.select { |possible| possible.include?(end_position) }
  end


  def enemy?(next_pos)
    !@board[next_pos].nil? && @board[next_pos].color != self.color
  end

  def is_not_blocked?(next_pos)
    @board[next_pos].nil? || @board[next_pos].color != self.color
  end

  def in_bounds?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7)
  end

  # def find_path_with_position(start_pos, end_pos)
  #   get_paths(start_pos)
  # end
  #
  # def trim_path_to_position(start_pos, end_pos)
  #   raise "Invalid Move: No Path" if find_path_with_position(start_pos, end_pos).empty?
  #   path = find_path_with_position(start_pos, end_pos).last
  #
  #   until path.last == end_pos
  #     path.pop
  #   end
  #   path
  # end
  #
  # def path_blocked?(start_pos, end_pos)
  #   path = trim_path_to_position(start_pos, end_pos)
  #
  #   path.drop(1).each_with_index do |space, idx|
  #     if idx == (path.length)
  #       puts "I'm in"
  #       return @board[space].color == self.color
  #     end
  #     unless @board[space].nil?
  #       puts space
  #       return true
  #     end
  #   end
  #   false
  # end


end
