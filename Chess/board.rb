require_relative 'bishop.rb'
require_relative 'king.rb'
require_relative 'knight.rb'
require_relative 'pawn.rb'
require_relative 'queen.rb'
require_relative 'rook.rb'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    make_starting_grid
  end

  def [](pos)
    x, y = pos[0], pos[1]
    @grid[x][y]
  end

  def []=(pos,new_value)
    x,y = pos[0], pos[1]
    @grid[x][y] = new_value
  end

  def move(start, end_pos)
    if valid_move?(start, end_pos)
      piece = self[start]
      self[end_pos] = self[start]
      self[start] = nil
      #piece.update_position(end_pos)
    else
      raise "Invalid Move"
    end
  end

  def valid_move?(start, end_pos)
    self[start] != nil && in_bounds?(end_pos)
  end

  def in_bounds?(end_pos)
    (0..7).to_a.product((0..7).to_a).include?(end_pos)
  end

  protected
  def make_starting_grid
    @grid[0][0] = Rook.new(:black, self, [0, 0])
    @grid[7][0] = Rook.new(:black, self, [7, 0])
    @grid[1][0] = Knight.new(:black, self, [1, 0])
    @grid[6][0] = Knight.new(:black, self, [6, 0])
    @grid[2][0] = Bishop.new(:black, self, [2, 0])
    @grid[5][0] = Bishop.new(:black, self, [5, 0])
    @grid[4][0] = Queen.new(:black, self, [4, 0])
    @grid[3][0] = King.new(:black, self, [3, 0])
    @grid[1].each_with_index do | _, idx |
      @grid[idx][1] = Pawn.new(:black, self, [idx, 1])
    end
    @grid[0][7] = Rook.new(:red, self, [0, 7])
    @grid[7][7] = Rook.new(:red, self, [7, 7])
    @grid[1][7] = Knight.new(:red, self, [1, 7])
    @grid[6][7] = Knight.new(:red, self, [6, 7])
    @grid[2][7] = Bishop.new(:red, self, [2, 7])
    @grid[5][7] = Bishop.new(:red, self, [5, 7])
    @grid[3][7] = Queen.new(:red, self, [3, 7])
    @grid[4][7] = King.new(:red, self, [4, 7])
    @grid[1].each_with_index do | _, idx |
      @grid[idx][6] = Pawn.new(:red, self, [idx, 6])
    end
  end

end
