require_relative "slideable"
class Queen < Piece
  include Slideable

  def initialize(position, board)
    super(position, board)
    @directions = [:diagonal, :horizontal]
  end

  def to_s
    "q"
  end

end
