require_relative "slideable"
class Queen < Piece
  include Slideable

  def initialize(position, board)
    super(position, board)
    @direction = [:diagonal, :horizontal]
  end

  def to_s
    "q"
  end

  def move_dirs
    moves(@direction)
  end

end
