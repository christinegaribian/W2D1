class Player

  def initialize(name, board)
    @board = board
    @display = Display.new(board)
    @name = name
  end


end
