require 'colorize'

class Display
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def render
    puts to_s
  end

  def to_s
    board.grid.each_with_index do | row, y |
      row.each_with_index do | space, x |
        unless board.grid[x][y].nil?
          piece_sym = board.grid[x][y].symbol
        else
          piece_sym = " "
        end

        if (x+y) % 2 == 0
          print piece_sym.colorize(:background => :green)
        else
          print piece_sym.colorize(:background => :light_yellow)
        end
      end
      puts
    end
  end

end
