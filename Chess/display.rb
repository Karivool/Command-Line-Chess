require 'colorize'
require_relative 'cursor.rb'

class Display
  include Cursorable
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = [0, 0]
  end

  def get_bg_color(x, y)
    if cursor == [x, y]
      bg_color = :blue
    elsif (x + y) % 2 == 0
      bg_color = :light_white
    elsif (x + y) % 2 == 1
      bg_color = :light_black
    end
    bg_color
  end

  def render
    system("clear")
    board.grid.each_with_index do | row, y |
      row.each_with_index do | space, x |
        unless board.grid[x][y].nil?
          piece_sym = board.grid[x][y].symbol
        else
          piece_sym = " "
        end
          bg_color = get_bg_color(x, y)


          print piece_sym.colorize(:background => bg_color)
      end
      puts
    end
  end

end
