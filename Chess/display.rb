require 'colorize'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = [0, 0]
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

        if cursor == [x, y]
          bg_color = :blue
        elsif (x + y) % 2 == 0
          bg_color = :green
        elsif (x + y) % 2 == 1
          bg_color = :light_yellow
        end
          print piece_sym.colorize(:background => bg_color)
      end
      puts
    end
  end

end
