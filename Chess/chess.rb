

class Chess
  attr_reader :board, :display

  def initialize
    @board = Board.new
    @display = Display.new(board)
  end

  def play
    until won?
      play_turn
    end
  end

  def play_turn
    start_position = get_position
    end_position = get_position
    move(start_position, end_position)
  end

  def get_position

  end

  def move

  end

end
