require_relative "stepable"
class Knight < Piece
  include Stepable

  def initialize(position = [0,0], board)
    super(position, board)
    @bases = [[2,1],[1,2]]
  end

  def to_s
    "H"
  end

end
