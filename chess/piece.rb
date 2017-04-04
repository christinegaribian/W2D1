class Piece
  attr_reader :board, :color
  attr_writer :position

  def initialize(position, board, color)
    @position = position
    @board = board
    @board[position]= self
    @color = color
  end

  def to_s
    "-"
  end

  def empty?
    self.is_a?(NullPiece)
  end
  #
  # def valid_moves()
  # end

  private
  def move_into_check(to_pos)

  end
end
