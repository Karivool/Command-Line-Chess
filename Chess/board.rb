
class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    make_starting_grid
  end

  def move(start, end_pos)
    if valid_move?(start, end_pos)
      @grid[end_pos] = @grid[start]
      @grid[start] = nil
    else
      raise "Invalid Move"
    end
  end

  def valid_move?(start, end_pos)
    @grid[start] != nil && @grid[start].valid_moves.include?(end_pos)
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
