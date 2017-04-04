require_relative "slideable"
class Rook < Piece
  include Slideable

  def initialize(position = [0,0], board)
    super(position, board)
    @directions = [:horizontal]
  end

  def to_s
    "R"
  end

end
