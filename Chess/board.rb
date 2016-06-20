
class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
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

end
