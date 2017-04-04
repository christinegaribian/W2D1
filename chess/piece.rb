class Piece
  attr_reader :position, :board

  def initialize(position, board)
    @position = position
    @board = board
    @board[position]= self
  end

  def to_s
    "-"
  end

  def empty?
    self.is_a?(NullPiece)
  end

  def valid_moves()
  end

  private
  def move_into_check(to_pos)

  end
end
