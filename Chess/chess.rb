require_relative 'display.rb'
require_relative 'board.rb'

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

  def won?
    false
  end

  def play_turn
    start_position = get_position
    end_position = get_position
    @board.move(start_position, end_position)
  end

  def get_position
    until false
      @display.render
      break unless @display.get_input.nil?
    end
    @display.cursor
  end

end

if __FILE__ == $PROGRAM_NAME
  c = Chess.new
  c.play
end
