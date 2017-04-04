require_relative "slideable"
class Bishop < Piece
  include Slideable

  def initialize(position = [0,1], board)
    super(position, board)
    @directions = [:diagonal]
  end

  def to_s
    "B"
  end
end
