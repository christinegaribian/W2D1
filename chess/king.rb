require_relative "stepable"
class King < Piece
  include Stepable

  def initialize(position = [0,0], board)
    super(position, board)
    @bases = [[1,0],[0,1],[1,1]]
  end

  def to_s
    "K"
  end

end
